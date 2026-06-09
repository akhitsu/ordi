import 'package:drift/drift.dart' show OrderingTerm;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../../../core/theme/app_colors.dart';
import '../../../data/local/app_database.dart';
import '../../../data/local/database_provider.dart';
import '../../../features/master_data/master_data_models.dart';
import '../../../features/master_data/master_data_service.dart';
import '../detail_menu/detail_menu_page.dart';
import 'new_transaction_models.dart';
import 'widgets/category_filter_list.dart';
import 'widgets/menu_product_card.dart';
import 'widgets/selected_items_bar.dart';

final cashierMenuCatalogProvider = FutureProvider<CashierMenuCatalog>((
  ref,
) async {
  final database = ref.watch(databaseProvider);
  final selectedOutlet =
      await (database.select(database.outlets)
            ..where((row) => row.isSelected.equals(true))
            ..orderBy([(row) => OrderingTerm.asc(row.name)])
            ..limit(1))
          .getSingleOrNull();

  final query = MasterDataQuery(outletUuid: selectedOutlet?.uuid);
  final service = ref.watch(masterDataServiceProvider);
  final cachedCatalog = await _loadCachedCatalog(
    database,
    outletUuid: selectedOutlet?.uuid,
  );

  try {
    final results = await Future.wait([
      service.fetchMenuCategories(query: query),
      service.fetchMenuItems(query: query),
    ]);

    final remoteCategories = results[0] as List<RemoteMenuCategory>;
    final remoteItems = results[1] as List<RemoteMenuItem>;

    final categories = <CashierCategory>[
      const CashierCategory(label: 'Semua', icon: TablerIcons.category),
      ...remoteCategories.map(
        (item) => CashierCategory(
          label: item.name,
          icon: TablerIcons.category_2,
          key: item.uuid,
        ),
      ),
    ];

    final products = remoteItems
        .map(
          (item) => CashierProduct(
            uuid: item.uuid,
            name: item.name,
            description: item.description ?? '',
            price: item.price,
            category: item.category?.uuid ?? '',
            outletUuid: item.outlet.uuid,
            imageUrl: item.imageUrl ?? '',
          ),
        )
        .toList();

    return CashierMenuCatalog(categories: categories, products: products);
  } catch (_) {
    if (cachedCatalog != null) {
      return cachedCatalog;
    }

    rethrow;
  }
});

class CashierMenuCatalog {
  const CashierMenuCatalog({required this.categories, required this.products});

  final List<CashierCategory> categories;
  final List<CashierProduct> products;
}

Future<CashierMenuCatalog?> _loadCachedCatalog(
  AppDatabase database, {
  required String? outletUuid,
}) async {
  final categoryQuery = database.select(database.menuCategories)
    ..orderBy([
      (row) => OrderingTerm.asc(row.sortOrder),
      (row) => OrderingTerm.asc(row.name),
    ]);
  if (outletUuid != null && outletUuid.isNotEmpty) {
    categoryQuery.where((row) => row.outletUuid.equals(outletUuid));
  }

  final itemQuery = database.select(database.menuItems)
    ..orderBy([(row) => OrderingTerm.asc(row.name)]);
  if (outletUuid != null && outletUuid.isNotEmpty) {
    itemQuery.where((row) => row.outletUuid.equals(outletUuid));
  }

  final categoryRows = await categoryQuery.get();
  final itemRows = await itemQuery.get();

  if (categoryRows.isEmpty && itemRows.isEmpty) {
    return null;
  }

  return CashierMenuCatalog(
    categories: [
      const CashierCategory(label: 'Semua', icon: TablerIcons.category),
      ...categoryRows.map(
        (row) => CashierCategory(
          label: row.name,
          icon: TablerIcons.category_2,
          key: row.uuid,
        ),
      ),
    ],
    products: itemRows
        .map(
          (row) => CashierProduct(
            uuid: row.uuid,
            name: row.name,
            description: row.description ?? '',
            price: row.price,
            category: row.categoryUuid ?? '',
            outletUuid: row.outletUuid,
            imageUrl: row.imageUrl ?? '',
          ),
        )
        .toList(),
  );
}

class NewTransactionPage extends ConsumerStatefulWidget {
  const NewTransactionPage({super.key});

  @override
  ConsumerState<NewTransactionPage> createState() => _NewTransactionPageState();
}

class _NewTransactionPageState extends ConsumerState<NewTransactionPage> {
  final _searchController = TextEditingController();
  String? _selectedCategory;
  String _query = '';
  int _itemCount = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final catalogState = ref.watch(cashierMenuCatalogProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 56,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(TablerIcons.arrow_left, size: 28),
        ),
        title: const Text(
          'Transaksi Baru',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 2, 16, 8),
            child: _SearchField(
              controller: _searchController,
              onChanged: (value) => setState(() => _query = value),
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: catalogState.when(
          data: _buildCatalog,
          loading: () => const _LoadingState(),
          error: (error, _) => _LoadErrorState(
            onRetry: () => ref.invalidate(cashierMenuCatalogProvider),
          ),
        ),
      ),
    );
  }

  Widget _buildCatalog(CashierMenuCatalog catalog) {
    final products = _filteredProducts(catalog.products);

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async => ref.invalidate(cashierMenuCatalogProvider),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: CategoryFilterList(
                    categories: catalog.categories,
                    selectedKey: _selectedCategory,
                    onSelected: (key) {
                      setState(() => _selectedCategory = key);
                    },
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  14,
                  0,
                  14,
                  _itemCount > 0 ? 92 : 20,
                ),
                sliver: products.isEmpty
                    ? const SliverFillRemaining(
                        hasScrollBody: false,
                        child: _EmptyProductState(),
                      )
                    : SliverList.separated(
                        itemCount: products.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final product = products[index];

                          return MenuProductCard(
                            product: product,
                            onTap: () => _openDetailMenu(product),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
        if (_itemCount > 0)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SelectedItemsBar(itemCount: _itemCount, onTap: () {}),
          ),
      ],
    );
  }

  List<CashierProduct> _filteredProducts(List<CashierProduct> products) {
    final normalizedQuery = _query.trim().toLowerCase();

    return products.where((product) {
      final matchesCategory =
          _selectedCategory == null || product.category == _selectedCategory;
      final matchesQuery =
          normalizedQuery.isEmpty ||
          product.name.toLowerCase().contains(normalizedQuery) ||
          product.description.toLowerCase().contains(normalizedQuery);

      return matchesCategory && matchesQuery;
    }).toList();
  }

  Future<void> _openDetailMenu(CashierProduct product) async {
    final quantity = await Navigator.of(context).push<int>(
      MaterialPageRoute<int>(builder: (_) => DetailMenuPage(product: product)),
    );

    if (!mounted || quantity == null) {
      return;
    }

    setState(() => _itemCount += quantity);
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Cari menu...',
          hintStyle: const TextStyle(
            color: Color(0xFF777D85),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: const Icon(
            TablerIcons.search,
            color: AppColors.primary,
            size: 24,
          ),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _LoadErrorState extends StatelessWidget {
  const _LoadErrorState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Data menu gagal dimuat.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1D1F24),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(onPressed: onRetry, child: const Text('Coba Lagi')),
          ],
        ),
      ),
    );
  }
}

class _EmptyProductState extends StatelessWidget {
  const _EmptyProductState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Text(
          'Menu tidak ditemukan',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF777D85),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

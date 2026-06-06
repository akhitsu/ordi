import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ordi/data/local/app_database.dart';

import 'package:ordi/app.dart';
import 'package:ordi/features/auth/auth_repository.dart';

void main() {
  testWidgets('shows login when there is no saved session', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(_FakeAuthRepository()),
        ],
        child: const OrdiApp(),
      ),
    );

    expect(find.text('Ordi POS'), findsOneWidget);
    await tester.pumpAndSettle();

    expect(find.text('Masuk Ordi POS'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
  });
}

class _FakeAuthRepository implements AuthRepository {
  @override
  Future<AuthSession?> restoreSession() async => null;

  @override
  Future<AuthSession> login({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {}
}

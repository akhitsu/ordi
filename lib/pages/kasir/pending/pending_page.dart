import 'package:flutter/material.dart';

class PendingPage extends StatelessWidget {
  const PendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pending Kasir')),
      body: const SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'Halaman pending kasir masih placeholder dan siap diisi alur transaksi tertunda.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mitra_surya_jaya/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await context.read<AuthProvider>().userLogout().then((value) {
              context.go('/');
            });
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_reactive_database/cake/global_providers.dart';
import 'package:isar_reactive_database/cake/ui/cake_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final overrides = await initProviders();

  runApp(
    ProviderScope(
      overrides: overrides,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CakePage(),
      ),
    );
  }
}

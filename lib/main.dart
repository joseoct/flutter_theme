import 'package:flutter/material.dart';
import 'package:flutter_theme/show_case_material_screen.dart';
import 'package:flutter_theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soma',
      home: Scaffold(
        appBar: AppBar(title: const Text('Soma')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const ShowcaseMaterial(),
          ),
        ),
      ),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}

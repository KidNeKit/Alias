import 'package:alias/resources/colors.dart';
import 'package:alias/resources/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AliasApp());
}

class AliasApp extends StatelessWidget {
  const AliasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      themeMode: ThemeMode.light,
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: primaryColor,
      ),
      body: Text(
        'Home',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}

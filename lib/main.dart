import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'resources/theme.dart';
import 'view_models/team_view_model.dart';
import 'views/home/home_screen.dart';
import 'views/teams/teams_screen.dart';

void main() {
  runApp(const AliasApp());
}

class AliasApp extends StatelessWidget {
  const AliasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TeamViewModel>(
          create: (context) => TeamViewModel(),
        ),
      ],
      child: MaterialApp(
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: const HomeScreen(),
        routes: {
          TeamScreen.routeName: (context) => const TeamScreen(),
        },
      ),
    );
  }
}

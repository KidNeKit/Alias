import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'resources/theme.dart';
import 'view_models/game_view_model.dart';
import 'view_models/pack_view_model.dart';
import 'view_models/team_view_model.dart';
import 'views/game_settings/game_settings_screen.dart';
import 'views/home/home_screen.dart';
import 'views/pack/pack_screen.dart';
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
        ChangeNotifierProvider<PackViewModel>(
          create: (context) => PackViewModel(),
        ),
        ChangeNotifierProvider<GameViewModel>(
          create: (context) => GameViewModel(),
        ),
      ],
      child: MaterialApp(
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: const HomeScreen(),
        routes: {
          TeamScreen.routeName: (context) => const TeamScreen(),
          GameSettingsScreen.routeName: (context) => const GameSettingsScreen(),
          PackScreen.routeName: (context) => const PackScreen(),
        },
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'resources/theme.dart';
import 'router/app_router.dart';
import 'view_models/game_settings_view_model.dart';
import 'view_models/game_view_model.dart';
import 'view_models/pack_view_model.dart';
import 'view_models/teams_view_model.dart';
import 'view_models/turn_view_model.dart';
import 'views/home/home_screen.dart';

void main() {
  runApp(AliasApp());
}

class AliasApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  AliasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TeamsViewModel>(
          create: (context) => TeamsViewModel(),
        ),
        ChangeNotifierProvider<GameSettingsViewModel>(
          create: (context) => GameSettingsViewModel(),
        ),
        ChangeNotifierProvider<PackViewModel>(
          create: (context) => PackViewModel(),
        ),
        ChangeNotifierProvider<GameViewModel>(
          create: (context) => GameViewModel(),
        ),
        ChangeNotifierProxyProvider<GameViewModel, TurnViewModel>(
          create: (context) => TurnViewModel(),
          update: (context, value, previous) {
            log('state updated. previous: $previous');
            if (previous != null) {
              previous.setGameViewModel = value;
            }
            return previous ?? TurnViewModel();
          },
        ),
      ],
      child: MaterialApp(
        theme: lightTheme,
        themeMode: ThemeMode.light,
        onGenerateRoute: _appRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}

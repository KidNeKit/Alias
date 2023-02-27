import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'resources/theme.dart';
import 'view_models/game_view_model.dart';
import 'view_models/pack_view_model.dart';
import 'view_models/teams_view_model.dart';
import 'view_models/turn_view_model.dart';
import 'views/game_settings/game_settings_screen.dart';
import 'views/home/home_screen.dart';
import 'views/lobby/lobby_screen.dart';
import 'views/pack/pack_screen.dart';
import 'views/play_screen/play_screen.dart';
import 'views/playing_teams/teams_screen.dart';
import 'views/team_info/team_info_screen.dart';
import 'views/teams_screen/teams_screen.dart';
import 'views/turn_result/turn_result_screen.dart';

void main() {
  runApp(const AliasApp());
}

class AliasApp extends StatelessWidget {
  const AliasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TeamsViewModel>(
          create: (context) => TeamsViewModel(),
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
        home: const HomeScreen(),
        routes: {
          PlayingTeamsScreen.routeName: (context) => const PlayingTeamsScreen(),
          GameSettingsScreen.routeName: (context) => const GameSettingsScreen(),
          PackScreen.routeName: (context) => const PackScreen(),
          LobbyScreen.routeName: (context) => const LobbyScreen(),
          PlayScreen.routeName: (context) => const PlayScreen(),
          TurnResultScreen.routeName: (context) => const TurnResultScreen(),
          TeamsScreen.routeName: (context) => const TeamsScreen(),
          TeamInfoScreen.routeName: (context) => const TeamInfoScreen(),
        },
      ),
    );
  }
}

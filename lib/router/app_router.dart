import 'package:flutter/material.dart';

import '../views/game_settings/game_settings_screen.dart';
import '../views/home/home_screen.dart';
import '../views/lobby/lobby_screen.dart';
import '../views/pack/pack_screen.dart';
import '../views/play_screen/play_screen.dart';
import '../views/playing_teams/teams_screen.dart';
import '../views/team_info/team_info_screen.dart';
import '../views/teams_screen/teams_screen.dart';
import '../views/turn_result/turn_result_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    var args = (settings.arguments ?? {}) as Map<dynamic, dynamic>;
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      case PlayingTeamsScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const PlayingTeamsScreen());
      case GameSettingsScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const GameSettingsScreen());
      case PackScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const PackScreen());
      case LobbyScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const LobbyScreen());
      case PlayScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const PlayScreen());
      case TurnResultScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const TurnResultScreen());
      case TeamsScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const TeamsScreen());
      case TeamInfoScreen.routeName:
        String? teamId = args['teamId'];
        return MaterialPageRoute(
          builder: (ctx) => TeamInfoScreen(teamId: teamId),
        );
      default:
        return null;
    }
  }
}

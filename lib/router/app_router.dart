import 'package:alias/router/fade_page_route_builder.dart';
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
        return FadePageRouteBuilder(child: const HomeScreen());
      case PlayingTeamsScreen.routeName:
        return FadePageRouteBuilder(child: const PlayingTeamsScreen());
      case GameSettingsScreen.routeName:
        return FadePageRouteBuilder(child: const GameSettingsScreen());
      case PackScreen.routeName:
        return FadePageRouteBuilder(child: const PackScreen());
      case LobbyScreen.routeName:
        return FadePageRouteBuilder(child: const LobbyScreen());
      case PlayScreen.routeName:
        return FadePageRouteBuilder(child: const PlayScreen());
      case TurnResultScreen.routeName:
        return FadePageRouteBuilder(child: const TurnResultScreen());
      case TeamsScreen.routeName:
        return FadePageRouteBuilder(child: const TeamsScreen());
      case TeamInfoScreen.routeName:
        String? teamId = args['teamId'];
        String teamName = args['teamName'] ?? '';
        return MaterialPageRoute(
          builder: (ctx) => TeamInfoScreen(
            teamId: teamId,
            teamName: teamName,
          ),
        );
      default:
        return null;
    }
  }
}

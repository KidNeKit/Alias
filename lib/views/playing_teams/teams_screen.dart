import 'package:alias/views/playing_teams/bottom_buttons.dart';
import 'package:alias/views/playing_teams/teams_settings/teams_settings.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import 'teams_listview/teams_listview.dart';

class PlayingTeamsScreen extends StatelessWidget {
  static const String routeName = '/playing_teams_screen';
  const PlayingTeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                'Select team quantity',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(height: 10.0),
              const TeamsSettings(),
              const SizedBox(height: 10.0),
              const TeamsListView(),
              const SizedBox(height: 10.0),
              const BottomButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:alias/views/teams_screen/teams_screen.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import '../playing_teams/teams_screen.dart';
import '../global_components/body_wrapper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWrapper(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            'Welcome Back!',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 15.0),
          ElevatedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(PlayingTeamsScreen.routeName),
            child: Text(
              'Start',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(TeamsScreen.routeName),
            child: Text(
              'Teams',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.settings,
              color: lightColor,
            ),
          ),
        ],
      ),
    );
  }
}

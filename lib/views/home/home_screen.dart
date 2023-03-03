import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import '../global_components/body_wrapper.dart';
import '../global_components/custom_button.dart';
import '../global_components/text/custom_titles.dart';
import '../playing_teams/teams_screen.dart';
import '../teams_screen/teams_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWrapper(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const CustomLargeTitle(text: 'Welcome Back!'),
          const SizedBox(height: 15.0),
          CustomButton(
            text: 'Start',
            onPressedFunc: () =>
                Navigator.of(context).pushNamed(PlayingTeamsScreen.routeName),
          ),
          const SizedBox(height: 10.0),
          CustomButton(
            text: 'Teams',
            onPressedFunc: () =>
                Navigator.of(context).pushNamed(TeamsScreen.routeName),
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

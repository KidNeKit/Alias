import 'package:flutter/material.dart';

import '../global_components/body_wrapper.dart';
import '../team_info/team_info_screen.dart';
import 'components/teams_list.dart';

class PlayingTeamsScreen extends StatelessWidget {
  static const String routeName = '/playing_teams_screen';
  const PlayingTeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   backgroundColor: darkColor,
        //   body: SafeArea(
        //     child: Container(
        //       width: double.infinity,
        //       padding: const EdgeInsets.all(15.0),
        //       child: Column(
        //         children: [
        //           Text(
        //             'Select team quantity',
        //             style: Theme.of(context).textTheme.labelSmall,
        //           ),
        //           const SizedBox(height: 10.0),
        //           const TeamsSettings(),
        //           const SizedBox(height: 10.0),
        //           const TeamsListView(),
        //           const SizedBox(height: 10.0),
        //           const BottomButtons(),
        //         ],
        //       ),
        //     ),
        //   ),
        // );

        BodyWrapper(
      floatingIcon: const Icon(Icons.add),
      floatingFunc: () =>
          Navigator.of(context).pushNamed(TeamInfoScreen.routeName),
      body: Column(
        children: [
          Text(
            'Choose teams',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '0 / 4',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          const SizedBox(height: 10.0),
          const Expanded(
            child: TeamsList(),
          ),
        ],
      ),
    );
  }
}

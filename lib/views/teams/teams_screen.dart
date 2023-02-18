import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import 'teams_listview/teams_listview.dart';

class TeamScreen extends StatelessWidget {
  static const String routeName = '/teams_screen';
  const TeamScreen({super.key});

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
              const TeamsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
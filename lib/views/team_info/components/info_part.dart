import 'package:alias/view_models/teams_view_model.dart';
import 'package:alias/views/global_components/text/custom_titles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoPart extends StatelessWidget {
  const InfoPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamsViewModel>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15.0),
          CustomSmallTitle(
              text: 'Current game score: ${value.team?.gamesStat}'),
          const SizedBox(height: 5.0),
          CustomSmallTitle(
              text: 'Best win streak: ${value.team?.bestWinStreak}'),
          const SizedBox(height: 5.0),
          CustomSmallTitle(
              text: 'Current win streak: ${value.team?.currentWinStreak}'),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }
}

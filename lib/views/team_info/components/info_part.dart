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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15.0),
          CustomSmallTitle(
              text: 'Current game score: ${value.team?.gamesStat}'),
          CustomSmallTitle(
              text: 'Best win streak: ${value.team?.bestWinStreak}'),
          CustomSmallTitle(
              text: 'Current win streak: ${value.team?.currentWinStreak}'),
        ],
      ),
    );
  }
}

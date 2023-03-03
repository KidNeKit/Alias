import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/game_settings_view_model.dart';
import '../../../view_models/teams_view_model.dart';
import '../../global_components/team_card_compressed.dart';
import '../../global_components/text/custom_titles.dart';

class TeamsList extends StatelessWidget {
  const TeamsList({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<TeamsViewModel>(context);
    return Expanded(
      child: FutureBuilder(
        future: Provider.of<TeamsViewModel>(context).getTeams(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: CustomMediumTitle(text: 'There are no teams'),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
            ),
            itemBuilder: (context, index) => TeamCardCompressed(
              team: snapshot.data![index],
              onPressedFunc: () {
                Provider.of<GameSettingsViewModel>(context, listen: false)
                    .selectTeam(snapshot.data![index]);
              },
            ),
            itemCount: snapshot.data!.length,
            physics: const BouncingScrollPhysics(),
          );
        },
      ),
    );
  }
}

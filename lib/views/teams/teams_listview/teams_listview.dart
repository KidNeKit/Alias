import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/game_view_model.dart';
import 'team_item.dart';

class TeamsListView extends StatelessWidget {
  const TeamsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<GameViewModel>(
        builder: (context, value, child) {
          return ListView.separated(
            itemCount: value.teamQuantity,
            separatorBuilder: (context, index) => const SizedBox(height: 5.0),
            itemBuilder: (context, index) => TeamItem(position: index),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/game_view_model.dart';
import '../../global_components/text/custom_titles.dart';

class PointsToWin extends StatelessWidget {
  const PointsToWin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<GameViewModel>(
          builder: (context, value, child) =>
              CustomLargeTitle(text: value.winPoints!.value.toString()),
        ),
        const SizedBox(width: 10.0),
        const CustomMediumTitle(text: 'points to win'),
      ],
    );
  }
}

import 'package:alias/view_models/game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PointsToWin extends StatelessWidget {
  const PointsToWin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<GameViewModel>(
          builder: (context, value, child) => Text(
            value.winPoints!.value.toString(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        const SizedBox(width: 10.0),
        Text(
          'points to win',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}

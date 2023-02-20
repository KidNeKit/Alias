import 'package:alias/view_models/game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentTurn extends StatelessWidget {
  const CurrentTurn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.centerRight,
        child: Consumer<GameViewModel>(
          builder: (context, value, child) => Text(
            'Turn ${value.turn}',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}

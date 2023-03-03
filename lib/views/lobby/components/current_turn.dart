import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/game_view_model.dart';
import '../../global_components/text/custom_titles.dart';

class CurrentTurn extends StatelessWidget {
  const CurrentTurn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.centerRight,
        child: Consumer<GameViewModel>(
          builder: (context, value, child) => CustomMediumTitle(
            text: 'Turn ${value.turn}',
          ),
        ),
      ),
    );
  }
}

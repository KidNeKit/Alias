import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/turn_view_model.dart';
import '../../turn_result/turn_result_screen.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TurnViewModel>(
      builder: (context, value, child) => Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                value.nextWord();
                if (value.isTurnBlocked) {
                  Navigator.of(context)
                      .pushReplacementNamed(TurnResultScreen.routeName);
                }
              },
              child: const Text('Skip'),
            ),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                value.markWordAsCorrect();
                if (value.isTurnBlocked) {
                  Navigator.of(context)
                      .pushReplacementNamed(TurnResultScreen.routeName);
                }
              },
              child: const Text('Correct'),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../resources/colors.dart';
import '../../../view_models/turn_view_model.dart';
import '../../../view_models/word_position_provider.dart';
import '../../global_components/text/custom_titles.dart';
import '../../turn_result/turn_result_screen.dart';

class WordCard extends StatelessWidget {
  const WordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            Provider.of<WordPositionProvider>(context, listen: false)
                    .setScreenSize =
                Size(constraints.maxWidth, constraints.maxHeight);
            return Consumer<TurnViewModel>(
                builder: (context, turnValue, child) {
              return Consumer<WordPositionProvider>(
                  builder: (context, positionValue, child) {
                var position = positionValue.position;
                positionValue.setTurnViewModel = turnValue;
                return GestureDetector(
                  onPanStart: (details) {
                    positionValue.setStartPosition(details);
                  },
                  onPanUpdate: (details) {
                    positionValue.updatePosition(details);
                    if (turnValue.isTurnBlocked && !positionValue.isDragging) {
                      Navigator.of(context)
                          .pushReplacementNamed(TurnResultScreen.routeName);
                    }
                  },
                  onPanEnd: (details) {
                    positionValue.endPosition();
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    transform: Matrix4.translationValues(0, position.dy, 0),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: lightColor,
                      ),
                      child: Center(
                        child: CustomLargeTitle(
                          text: turnValue.currentWord,
                          color: darkColor,
                        ),
                      ),
                    ),
                  ),
                );
              });
            });
          },
        ),
      ),
    );
  }
}

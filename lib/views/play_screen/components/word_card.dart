import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../resources/colors.dart';
import '../../../view_models/turn_view_model.dart';
import '../../global_components/text/custom_titles.dart';

class WordCard extends StatelessWidget {
  const WordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TurnViewModel>(
      builder: (context, value, child) {
        return Expanded(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: lightColor,
            ),
            child: Center(
              child: CustomLargeTitle(
                text: value.currentWord,
                color: darkColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

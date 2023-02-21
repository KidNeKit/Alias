import 'package:alias/resources/colors.dart';
import 'package:alias/view_models/turn_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultHeader extends StatelessWidget {
  const ResultHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TurnViewModel>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '+${value.correctWords.length}',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}

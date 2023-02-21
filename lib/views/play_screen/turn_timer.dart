import 'package:alias/view_models/turn_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TurnTimer extends StatelessWidget {
  const TurnTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TurnViewModel>(
      builder: (context, value, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 20,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            value.secondsLeft.toString(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}

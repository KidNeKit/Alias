import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/turn_view_model.dart';
import '../../global_components/text/custom_titles.dart';

class TurnTimer extends StatefulWidget {
  const TurnTimer({super.key});

  @override
  State<TurnTimer> createState() => _TurnTimerState();
}

class _TurnTimerState extends State<TurnTimer> {
  late double _width;
  late double _timerWidth;
  late double _lineWidth;

  @override
  Widget build(BuildContext context) {
    return Consumer<TurnViewModel>(
      builder: (context, value, child) =>
          LayoutBuilder(builder: (ctx, constraints) {
        _width = constraints.maxWidth;
        _timerWidth = 0.2 * _width;
        _lineWidth = _width - _timerWidth + (0.1 * _timerWidth);
        return SizedBox(
          height: _timerWidth,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: _buildTimeLine(value.spendPercentage),
              ),
              Positioned(
                right: 0,
                child: _buildTimer(value.secondsLeft),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildTimeLine(double percentage) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        bottomLeft: Radius.circular(20.0),
      ),
      child: Stack(
        children: [
          Container(
            height: 30,
            width: _lineWidth,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
            ),
          ),
          Container(
            height: 30,
            width: percentage * _lineWidth,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimer(int secondsLeft) {
    return Container(
      height: _timerWidth,
      width: _timerWidth,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: CustomLargeTitle(text: secondsLeft.toString()),
      ),
    );
  }
}

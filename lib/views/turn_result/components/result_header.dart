import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_models/turn_view_model.dart';
import '../../global_components/text/custom_titles.dart';

class ResultHeader extends StatelessWidget {
  const ResultHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TurnViewModel>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomLargeTitle(text: '+${value.correctWords.length}'),
        ],
      ),
    );
  }
}

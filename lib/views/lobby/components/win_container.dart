import 'package:alias/view_models/game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../global_components/text/custom_titles.dart';

class WinContainer extends StatelessWidget {
  const WinContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, value, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomMediumTitle(text: 'We have a winner!'),
          const SizedBox(height: 10.0),
          CustomMediumTitle(
              text: 'Congratulations, \'${value.winner.teamName}\''),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20.0),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: const Icon(
                  Icons.replay,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

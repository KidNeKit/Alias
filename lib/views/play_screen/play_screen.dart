import 'dart:async';
import 'dart:developer';

import 'package:alias/view_models/game_view_model.dart';
import 'package:alias/view_models/turn_view_model.dart';
import 'package:alias/views/play_screen/turn_timer.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  static const String routeName = '/play_screen';
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  void initState() {
    Provider.of<TurnViewModel>(context, listen: false).startTurn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const TurnTimer(),
              const Spacer(),
              Consumer<TurnViewModel>(
                builder: (context, value, child) {
                  return Text(
                    value.showedWord,
                    style: Theme.of(context).textTheme.labelLarge,
                  );
                },
              ),
              const Spacer(),
              Consumer<TurnViewModel>(
                builder: (context, value, child) => Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          value.nextWord();
                        },
                        child: const Text('Skip'),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          value.markWordAsCorrect();
                        },
                        child: const Text('Correct'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class WordPlayer extends StatelessWidget {
//   const WordPlayer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
        
//       ],
//     );
//   }
// }

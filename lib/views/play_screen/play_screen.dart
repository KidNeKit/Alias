import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../view_models/turn_view_model.dart';
import '../turn_result/turn_result_screen.dart';
import 'turn_timer.dart';

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
              Consumer<TurnViewModel>(
                builder: (context, value, child) {
                  return Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: lightColor),
                      child: Center(
                        child: Text(
                          value.currentWord,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: darkColor),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Consumer<TurnViewModel>(
                builder: (context, value, child) => Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          value.nextWord();
                          if (value.isTurnBlocked) {
                            Navigator.of(context).pushReplacementNamed(
                                TurnResultScreen.routeName);
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
                            Navigator.of(context).pushReplacementNamed(
                                TurnResultScreen.routeName);
                          }
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

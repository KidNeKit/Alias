import 'package:alias/views/lobby/lobby_screen.dart';
import 'package:alias/views/turn_result/result_header/result_header.dart';
import 'package:alias/views/turn_result/words_listview/words_listview.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class TurnResultScreen extends StatelessWidget {
  static const String routeName = '/turn_result_screen';
  const TurnResultScreen({super.key});

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
              const ResultHeader(),
              const WordsListView(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LobbyScreen.routeName);
                },
                child: Text(
                  'Continue',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

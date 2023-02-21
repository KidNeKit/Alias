import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../view_models/turn_view_model.dart';
import '../lobby/lobby_screen.dart';
import 'result_header/result_header.dart';
import 'words_listview/words_listview.dart';

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
                  Provider.of<TurnViewModel>(context, listen: false).endTurn();
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

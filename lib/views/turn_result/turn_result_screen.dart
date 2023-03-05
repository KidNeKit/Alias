import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/turn_view_model.dart';
import '../global_components/body_wrapper_animated.dart';
import '../global_components/text/custom_titles.dart';
import '../lobby/lobby_screen.dart';
import 'components/result_header.dart';
import 'components/words_listview.dart';

class TurnResultScreen extends StatelessWidget {
  static const String routeName = '/turn_result_screen';
  const TurnResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWrapperAnimated(
      body: Column(
        children: [
          const ResultHeader(),
          const WordsListView(),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              Provider.of<TurnViewModel>(context, listen: false).endTurn();
              Navigator.of(context).pushReplacementNamed(LobbyScreen.routeName);
            },
            child: const CustomMediumTitle(text: 'Continue'),
          ),
        ],
      ),
    );
  }
}

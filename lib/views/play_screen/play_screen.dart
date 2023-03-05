import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/game_view_model.dart';
import '../../view_models/turn_view_model.dart';
import '../global_components/body_wrapper_animated.dart';
import 'components/turn_timer.dart';
import 'components/word_card.dart';

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
    return WillPopScope(
      onWillPop: () async {
        log('pop');
        Provider.of<GameViewModel>(context, listen: false).setDefaultValues();
        Provider.of<TurnViewModel>(context, listen: false).refreshState();
        return true;
      },
      child: BodyWrapperAnimated(
        body: Column(
          children: const [
            TurnTimer(),
            WordCard(),
            //BottomButtons(),
          ],
        ),
      ),
    );
  }
}

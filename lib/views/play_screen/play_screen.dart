import 'package:alias/views/play_screen/components/word_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../view_models/turn_view_model.dart';
import '../global_components/body_wrapper_animated.dart';
import '../global_components/text/custom_titles.dart';
import 'components/bottom_buttons.dart';
import 'components/turn_timer.dart';

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
    return BodyWrapperAnimated(
      body: Column(
        children: const [
          TurnTimer(),
          WordCard(),
          BottomButtons(),
        ],
      ),
    );
  }
}

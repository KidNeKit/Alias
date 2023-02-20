import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class LobbyScreen extends StatelessWidget {
  static const String routeName = '/lobby_screen';
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}

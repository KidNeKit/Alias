import 'dart:developer';

import 'package:alias/views/global_components/body_wrapper.dart';
import 'package:alias/views/global_components/team_card.dart';
import 'package:flutter/material.dart';

class TeamStatsScreen extends StatelessWidget {
  static const String routeName = '/team_stats';
  const TeamStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String index = args['index'] ?? '';
    return BodyWrapper(
      body: Hero(
        tag: 'team_$index',
        child: const TeamCard(),
      ),
    );
  }
}

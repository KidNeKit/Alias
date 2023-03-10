import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/teams_view_model.dart';
import '../global_components/body_wrapper_animated.dart';
import '../global_components/team_card.dart';
import '../team_info/team_info_screen.dart';

class TeamsScreen extends StatelessWidget {
  static const String routeName = '/teams_screen';
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWrapperAnimated(
      body: FutureBuilder(
        future: Provider.of<TeamsViewModel>(context).getTeams(),
        builder: (context, snapshot) {
          log('getting data in futurebuilder');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'There is no data',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            );
          }
          log('rebuilding listview');
          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                TeamInfoScreen.routeName,
                arguments: {
                  'teamId': snapshot.data![index].id,
                  'teamName': snapshot.data![index].name,
                },
              ),
              child: Hero(
                tag: 'team_${snapshot.data![index].id}',
                child: TeamCard(
                  teamName: snapshot.data![index].name,
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10.0),
          );
        },
      ),
    );
  }
}

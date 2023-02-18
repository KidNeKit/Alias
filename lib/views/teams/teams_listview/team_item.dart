import 'package:alias/resources/colors.dart';
import 'package:alias/view_models/team_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamItem extends StatelessWidget {
  final int _position;
  const TeamItem({required int position, super.key}) : _position = position;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: primaryColor,
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            color: lightColor,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              onChanged: (value) =>
                  Provider.of<TeamViewModel>(context, listen: false)
                      .changeTeamName(_position, value),
            ),
          ),
        ],
      ),
    );
  }
}

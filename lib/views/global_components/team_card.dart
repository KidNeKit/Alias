import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class TeamCard extends StatefulWidget {
  final String _teamName;

  const TeamCard({String teamName = '', super.key}) : _teamName = teamName;

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  final double _cardHeight = 130;

  late double _bodyHeight;
  late double _leftPadding;
  late double _cardWidth;

  @override
  Widget build(BuildContext context) {
    _bodyHeight = 0.7 * _cardHeight;
    _leftPadding = _cardHeight - _bodyHeight;
    return LayoutBuilder(
      builder: (_, constraints) {
        _cardWidth = constraints.maxWidth;
        return SizedBox(
          height: _cardHeight,
          width: double.infinity,
          child: Stack(
            children: [
              _printCardUpper(),
              _printCardBody(),
              _printAvatarPadding(),
              _printAvatar(),
            ],
          ),
        );
      },
    );
  }

  Widget _printCardUpper() {
    return Padding(
      padding: EdgeInsets.only(top: _leftPadding / 2),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 0.9 * _cardWidth,
          height: _leftPadding,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }

  Widget _printCardBody() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _bodyHeight,
        width: double.infinity,
        padding: const EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(widget._teamName,
              style: Theme.of(context).textTheme.labelMedium),
        ),
      ),
    );
  }

  Widget _printAvatarPadding() {
    return Positioned(
      left: 0.09 * _cardWidth,
      child: CircleAvatar(
        maxRadius: _leftPadding,
        backgroundColor: darkColor,
      ),
    );
  }

  Widget _printAvatar() {
    double avatarPadding = 0.01 * _cardWidth;
    return Positioned(
      left: 0.09 * _cardWidth + avatarPadding,
      top: avatarPadding,
      child: CircleAvatar(
        maxRadius: _leftPadding - avatarPadding,
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class TeamCard extends StatefulWidget {
  final bool _isAnimated;
  const TeamCard({bool isAnimated = false, super.key})
      : _isAnimated = isAnimated;

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> with TickerProviderStateMixin {
  final double _cardHeight = 130;

  late double _bodyHeight;
  late double _leftPadding;
  late double _cardWidth;
  late AnimationController _opacityController;

  double _opacity = 0;

  @override
  void initState() {
    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    if (widget._isAnimated) {
      _opacityController.addListener(() {
        setState(() {
          _opacity = _opacityController.value;
        });
      });
      _opacityController.forward();
    } else {
      _opacity = 1.0;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bodyHeight = 0.7 * _cardHeight;
    _leftPadding = _cardHeight - _bodyHeight;
    return Opacity(
      opacity: _opacity,
      child: LayoutBuilder(builder: (_, constraints) {
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
      }),
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
            color: lightYellow,
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
        decoration: BoxDecoration(
          color: lightPurple,
          borderRadius: BorderRadius.circular(20.0),
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
        backgroundColor: lightPurple,
      ),
    );
  }

  @override
  void dispose() {
    _opacityController.dispose();
    super.dispose();
  }
}

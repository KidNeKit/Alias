import 'package:alias/resources/colors.dart';
import 'package:flutter/material.dart';

class TeamCardCompressed extends StatefulWidget {
  final Function() _onPressedFunc;

  const TeamCardCompressed({required Function() onPressedFunc, super.key})
      : _onPressedFunc = onPressedFunc;

  @override
  State<TeamCardCompressed> createState() => _TeamCardCompressedState();
}

class _TeamCardCompressedState extends State<TeamCardCompressed> {
  late double _cardHeight;
  late double _bodyHeight;
  late double _avatarPaddingRadius;
  late double _cardWidth;

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget._onPressedFunc,
      child: LayoutBuilder(builder: (context, constraints) {
        _cardHeight = constraints.maxHeight;
        _bodyHeight = 0.8 * _cardHeight;
        _avatarPaddingRadius = _cardHeight - _bodyHeight;
        _cardWidth = constraints.maxWidth;
        return SizedBox(
          width: constraints.maxWidth,
          child: Stack(
            children: [
              _printCardUpper(),
              _printCardBody(),
              _printAvatarPadding(),
              _printAvatar(),
              if (_isSelected) _printSelectedLayer(),
              if (_isSelected) _printSelectedIcon(),
            ],
          ),
        );
      }),
    );
  }

  Widget _printCardUpper() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 0.1 * _cardHeight),
        child: Container(
          width: _cardWidth,
          height: 0.3 * _cardHeight,
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
    return Align(
      alignment: Alignment.topCenter,
      child: CircleAvatar(
        maxRadius: _avatarPaddingRadius,
        backgroundColor: darkColor,
      ),
    );
  }

  Widget _printAvatar() {
    double avatarPadding = 0.02 * _cardWidth;
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: avatarPadding),
        child: CircleAvatar(
          maxRadius: _avatarPaddingRadius - avatarPadding,
          backgroundColor: lightPurple,
        ),
      ),
    );
  }

  Widget _printSelectedLayer() {
    return Opacity(
      opacity: 0.5,
      child: Container(
        height: _cardHeight,
        width: _cardWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _printSelectedIcon() {
    return Center(
      child: Container(
        height: _cardHeight / 2,
        width: _cardHeight / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: lightPurple,
        ),
        child: Center(
          child: Icon(
            Icons.check,
            color: primaryColor,
            size: 50,
          ),
        ),
      ),
    );
  }
}

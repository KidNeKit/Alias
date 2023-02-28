import 'package:alias/resources/colors.dart';
import 'package:flutter/material.dart';

class TeamCardCompressed extends StatefulWidget {
  final String _teamId;
  final String _teamName;
  final Function() _onPressedFunc;
  final int _index;

  const TeamCardCompressed(
      {required String teamId,
      required String teamName,
      required Function() onPressedFunc,
      required int index,
      super.key})
      : _teamId = teamId,
        _teamName = teamName,
        _onPressedFunc = onPressedFunc,
        _index = index;

  @override
  State<TeamCardCompressed> createState() => _TeamCardCompressedState();
}

class _TeamCardCompressedState extends State<TeamCardCompressed>
    with SingleTickerProviderStateMixin {
  late double _cardHeight;
  late double _bodyHeight;
  late double _avatarPaddingRadius;
  late double _cardWidth;
  late AnimationController _opacityController;

  bool _isSelected = false;
  bool _isAnimated = false;

  @override
  void initState() {
    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _opacityController.addListener(() => setState(() {}));
    Future.delayed(
      Duration(milliseconds: widget._index * 100),
      () => _opacityController.forward().then((value) => _isAnimated = true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityController.value,
      child: GestureDetector(
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
      ),
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
        padding: const EdgeInsets.all(10.0).copyWith(bottom: 30.0),
        decoration: BoxDecoration(
          color: lightPurple,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              widget._teamName,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: darkColor),
            ),
          ),
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

  @override
  void dispose() {
    _opacityController.dispose();
    super.dispose();
  }
}

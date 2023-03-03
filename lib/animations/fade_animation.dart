import 'dart:developer';

import 'package:alias/router/fade_page_route_builder.dart';
import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final Widget _child;
  final Duration _duration;
  final Duration _delay;
  const FadeAnimation(
      {required Widget child,
      required Duration duration,
      Duration delay = const Duration(milliseconds: 0),
      super.key})
      : _child = child,
        _duration = duration,
        _delay = delay;

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _opacityController;

  @override
  void initState() {
    _opacityController = AnimationController(
      vsync: this,
      duration: widget._duration,
    );
    _opacityController.addListener(() => setState(() {}));
    Future.delayed(
      widget._delay,
      () => _opacityController.forward(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _opacityController.reverse();
        return true;
      },
      child: FadeTransition(
        opacity: _opacityController,
        child: widget._child,
      ),
    );
  }

  @override
  void dispose() {
    _opacityController.dispose();
    super.dispose();
  }
}

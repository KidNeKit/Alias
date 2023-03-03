import 'package:flutter/material.dart';

class FadePageRouteBuilder<T> extends PageRouteBuilder {
  static const pageTransitionDuration = Duration(milliseconds: 500);

  final Widget child;
  FadePageRouteBuilder({required this.child})
      : super(
          pageBuilder: (context, animation, anotherAnimation) => child,
          transitionDuration: pageTransitionDuration,
          reverseTransitionDuration: pageTransitionDuration,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      FadeTransition(
        opacity: animation,
        child: child,
      );
}

import 'package:flutter/material.dart';

import '../../animations/fade_animation.dart';
import '../../router/fade_page_route_builder.dart';
import 'body_wrapper.dart';

class BodyWrapperAnimated extends BodyWrapper {
  const BodyWrapperAnimated(
      {required Widget body,
      Icon? floatingIcon,
      Function()? floatingFunc,
      super.key})
      : super(
            body: body, floatingFunc: floatingFunc, floatingIcon: floatingIcon);

  @override
  Widget buildBody() {
    return FadeAnimation(
      duration: FadePageRouteBuilder.pageTransitionDuration,
      delay: FadePageRouteBuilder.pageTransitionDuration,
      child: buildChild(),
    );
  }
}

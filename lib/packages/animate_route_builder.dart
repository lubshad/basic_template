import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

const defaultTransitionDuration = Duration(milliseconds: 300);

class FadePageRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  FadePageRouteBuilder({required this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve = Curves.ease;
            var tween =
                Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: defaultTransitionDuration,
        );
}

class NoTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}

class NoTransition<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  NoTransition({required this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
          transitionDuration: Duration.zero,
        );
}

class FadeScaleRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  FadeScaleRouteBuilder({required this.builder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve = Curves.ease;
            var tween =
                Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
            return FadeScaleTransition(
              animation: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: defaultTransitionDuration,
        );
}

class DownToTopRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  DownToTopRoute({required this.builder})
      : super(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: defaultTransitionDuration,
        );
}

class LeftToRight<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  LeftToRight({required this.builder})
      : super(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(-1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: defaultTransitionDuration,
        );
}

class RightToLeft<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  RightToLeft({required this.builder})
      : super(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) =>
              builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: defaultTransitionDuration,
        );
}

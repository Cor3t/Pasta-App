import 'package:flutter/material.dart';

class SlideLeftRoute extends PageRouteBuilder {
  final Widget? child;

  SlideLeftRoute({this.child})
      : super(pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        });
}

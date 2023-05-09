import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox({Key? key, required this.child}) : super(key: key);

  final Widget child;

  /// This is a custom widget that we created to create the frosted glass effect. We are using a Stack widget to place the blur effect and the gradient effect at the back of the child widget. The child widget is placed at the front of the blur effect and the gradient effect.
  /// The [child] argument is the widget that we want to place at the front of the blur effect and the gradient effect.
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            /// We are using a Stack widget to place the blur effect and the gradient effect at the back of the child widget. The child widget is placed at the front of the blur effect and the gradient effect.
            BackdropFilter(
              filter: ImageFilter.blur(
                /// The sigmaX and sigmaY arguments are used to control the blur effect.
                sigmaX: 4.0,
                sigmaY: 4.0,
              ),
              child: Container(),
            ),
            // gradient effect
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withOpacity(0.13)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.15),
                      Colors.white.withOpacity(0.05),
                    ]),
              ),
            ),

            /// The child widget is placed at the front of the blur effect and the gradient effect.
            Center(child: child),
          ],
        ),
      ),
    );
  }
}

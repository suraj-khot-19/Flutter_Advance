import 'package:flutter/material.dart';
/*
impoting math
*/
import 'dart:math' as math;

import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class FlutterAnimatedBuilder extends StatefulWidget {
  const FlutterAnimatedBuilder({super.key});

  @override
  State<FlutterAnimatedBuilder> createState() => _FlutterAnimatedBuilderState();
}

//extends **TickerProviderStateMixin**
/*
Provides [Ticker] objects that are configured to only tick while the current tree is enabled, as defined by [TickerMode].To create an [AnimationController] in a class that uses this mixin, pass vsync: this to the animation controller constructor whenever you create a new animation controller.If you only have a single [Ticker] (for example only a single [AnimationController]) for the lifetime of your [State], then using a [SingleTickerProviderStateMixin] is more efficient. 
 */
class _FlutterAnimatedBuilderState extends State<FlutterAnimatedBuilder>
    with TickerProviderStateMixin {
  //creating controller
  late AnimationController animationController = AnimationController(
      vsync: this, duration: const Duration(seconds: 10))
    ..repeat(); //Starts running this animation in the forward direction, and restarts the animation when it completes.
  //must be dispose
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animated Builder",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white12,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    const Text("rotate"),
                    AnimatedBuilder(
                      animation: animationController,
                      child: const FlutterLogo(
                        size: 60,
                      ),
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: animationController.value * 3.0 * math.pi,
                          child: child,
                        );
                      },
                    ),
                    const Text("Flip"),
                    AnimatedBuilder(
                      animation: animationController,
                      child: const FlutterLogo(
                        size: 60,
                      ),
                      builder: (context, child) {
                        return Transform.flip(
                          flipX: true,
                          // flipY: true,
                          child: child,
                        );
                      },
                    ),
                    const Text("Scale"),
                    AnimatedBuilder(
                      animation: animationController,
                      child: const FlutterLogo(
                        size: 60,
                      ),
                      builder: (context, child) {
                        return Transform.scale(
                          scaleX: 3,
                          // scaleY: 3,
                          child: child,
                        );
                      },
                    ),
                    const Text("Offset"),
                    AnimatedBuilder(
                      animation: animationController,
                      child: const FlutterLogo(
                        size: 60,
                      ),
                      builder: (context, child) {
                        return Transform.translate(
                          offset: const Offset(30.30, 15.0),
                          child: child,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            CodeDisplay(text: MyCodes().animatedBuilder)
          ],
        ),
      ),
    );
  }
}

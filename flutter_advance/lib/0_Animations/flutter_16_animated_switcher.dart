import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class Flutter16AnimatedSwitcher extends StatefulWidget {
  const Flutter16AnimatedSwitcher({super.key});

  @override
  State<Flutter16AnimatedSwitcher> createState() =>
      _Flutter16AnimatedSwitcherState();
}

class _Flutter16AnimatedSwitcherState extends State<Flutter16AnimatedSwitcher> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Switcher"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white10,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      child: Text(
                        count.toString(),
                        style: const TextStyle(fontSize: 25),
                        //***Creates a key that delegates its [operator==] to the given value.
                        key: ValueKey(count),
                      ),
                      //custom animation
                      /*
              A function that wraps a new [child] with an animation that transitions the [child] in when the animation runs in the forward direction and out when the animation runs in the reverse direction. This is only called when a new [child] is set (not for each build), or when a new [transitionBuilder] is set. If a new [transitionBuilder] is set, then the transition is rebuilt for the current child and all previous children using the new [transitionBuilder]. The function must not return null.
              The default is [AnimatedSwitcher.defaultTransitionBuilder].
                      */
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      child: const Text("Add"),
                    ),
                  ],
                ),
              ),
            ),
            CodeDisplay(text: MyCodes().animatedSwitcher)
          ],
        ),
      ),
    );
  }
}

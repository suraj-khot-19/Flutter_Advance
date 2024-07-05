import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class Flutter03AnimatedCrossFade extends StatefulWidget {
  const Flutter03AnimatedCrossFade({super.key});

  @override
  State<Flutter03AnimatedCrossFade> createState() =>
      _Flutter03AnimatedCrossFadeState();
}

class _Flutter03AnimatedCrossFadeState
    extends State<Flutter03AnimatedCrossFade> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Cross Fade"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white24,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    /*
                     * Creates a cross-fade animation widget.
                      The [duration] of the animation is the same for all components (fade in, fade out, and size), 
                      and you can pass [Interval]s instead of [Curve]s in order to have finer control, e.g., 
                      creating an overlap between the fades.
                     */
                    AnimatedCrossFade(
                      firstChild: Image.asset(
                        "assets/ram.jpg",
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      secondChild: Image.asset(
                        "assets/balaji.png",
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      crossFadeState:
                          //using button
                          isSwitch
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                      duration: const Duration(seconds: 2),
                      //The fade curve of the first child.Defaults to [Curves.linear].
                      firstCurve: Curves.easeInOutCirc,
                      //The fade curve of the second child.Defaults to [Curves.linear].
                      secondCurve: Curves.easeInOutCubic,
                      //The curve of the animation between the two children's sizes.Defaults to [Curves.linear].
                      sizeCurve: Curves.bounceInOut,
                    ),
                    //button
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isSwitch = !isSwitch;
                        });
                      },
                      child: const Text("Switch"),
                    ),
                  ],
                ),
              ),
            ),
            CodeDisplay(text: MyCodes().animatedCrossFade)
          ],
        ),
      ),
    );
  }
}

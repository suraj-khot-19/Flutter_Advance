import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class Flutter14AnimationRotation extends StatefulWidget {
  const Flutter14AnimationRotation({super.key});

  @override
  State<Flutter14AnimationRotation> createState() =>
      _Flutter14AnimationRotationState();
}

class _Flutter14AnimationRotationState
    extends State<Flutter14AnimationRotation> {
  //initial rotation
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Rotational Widget"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white24,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Center(
                //Creates a widget that animates its rotation implicitly.
                child: AnimatedRotation(
                  turns: turns,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutBack,
                  child: const FlutterLogo(
                    size: 200,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  turns += 1 / 5;
                });
              },
              child: const Text("Turn"),
            ),
            CodeDisplay(text: MyCodes().animationRotation)
          ],
        ),
      ),
    );
  }
}

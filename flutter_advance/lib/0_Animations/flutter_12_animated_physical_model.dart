import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class Flutter12AnimatedPhysicalModel extends StatefulWidget {
  const Flutter12AnimatedPhysicalModel({super.key});

  @override
  State<Flutter12AnimatedPhysicalModel> createState() =>
      _Flutter12AnimatedPhysicalModelState();
}

class _Flutter12AnimatedPhysicalModelState
    extends State<Flutter12AnimatedPhysicalModel> {
  bool isSeleceted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Physical Model"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    /*
                    Creates a widget that animates the properties of a [PhysicalModel].
                The [elevation] must be non-negative.
                Animating [color] is optional and is controlled by the [animateColor] flag.
                Animating [shadowColor] is optional and is controlled by the [animateShadowColor] flag
                     */
                    AnimatedPhysicalModel(
                      shape: BoxShape.circle,
                      elevation: isSeleceted ? 20.0 : 5.0,
                      color: Colors.green,
                      shadowColor: Colors.white,
                      duration: const Duration(seconds: 1),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isSeleceted = !isSeleceted;
                        });
                      },
                      child: const Text("press me!"),
                    ),
                  ],
                ),
              ),
            ),
            CodeDisplay(text: MyCodes().animatedPhysicalModel),
          ],
        ),
      ),
    );
  }
}

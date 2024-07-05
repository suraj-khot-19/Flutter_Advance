import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class Flutter04AnimatedDefaultTextStyle extends StatefulWidget {
  const Flutter04AnimatedDefaultTextStyle({super.key});

  @override
  State<Flutter04AnimatedDefaultTextStyle> createState() =>
      _Flutter04AnimatedDefaultTextStyleState();
}

class _Flutter04AnimatedDefaultTextStyleState
    extends State<Flutter04AnimatedDefaultTextStyle> {
  bool change = false;
  double fontsize = 16;
  Color color = Colors.tealAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Default Text style"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              color: Colors.white24,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      //Creates a widget that animates the default text style implicitly.
                      child: AnimatedDefaultTextStyle(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontsize,
                          color: color,
                        ),
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOutExpo,
                        child: const Text("Jay shree Ram"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //using advantage of it using set state
                        setState(() {
                          change ? fontsize = 30 : fontsize = 16;
                          change
                              ? color = const Color.fromARGB(255, 173, 89, 5)
                              : color = Colors.tealAccent;

                          change = !change;
                        });
                      },
                      child: const Text("Change"),
                    ),
                  ],
                ),
              ),
            ),
            CodeDisplay(
              text: MyCodes().animatedDefaultTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

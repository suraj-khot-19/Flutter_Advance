import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class Flutter10AnimatedOpacity extends StatefulWidget {
  const Flutter10AnimatedOpacity({super.key});

  @override
  State<Flutter10AnimatedOpacity> createState() =>
      _Flutter10AnimatedOpacityState();
}

class _Flutter10AnimatedOpacityState extends State<Flutter10AnimatedOpacity> {
  double opacityLevel = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Opacity"),
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
                    //Creates a widget that animates its opacity implicitly.The [opacity] argument must be between zero and one, inclusive
                    AnimatedOpacity(
                      opacity: opacityLevel,
                      duration: const Duration(seconds: 3),
                      curve: Curves.easeInCirc,
                      child: const FlutterLogo(
                        size: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //by using set state opacity will change to 0-1
                        setState(() {
                          opacityLevel = opacityLevel == 1 ? 0 : 1;
                        });
                      },
                      child: const Text(
                        "Change Opacity",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CodeDisplay(text: MyCodes().animatedOpacity)
          ],
        ),
      ),
    );
  }
}

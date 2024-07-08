import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class Flutter11AnimatedPadding extends StatefulWidget {
  const Flutter11AnimatedPadding({super.key});

  @override
  State<Flutter11AnimatedPadding> createState() =>
      _Flutter11AnimatedPaddingState();
}

class _Flutter11AnimatedPaddingState extends State<Flutter11AnimatedPadding> {
  double paddingValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Padding"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white24,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //using setstate to change padding
                      setState(() {
                        paddingValue = paddingValue == 0.0 ? 100.0 : 0.0;
                      });
                    },
                    child: const Text("Change Padding"),
                  ),
                  Text("Padding$paddingValue"),
                  //Creates a widget that insets its child by a value that animates implicitly.
                  AnimatedPadding(
                    padding: EdgeInsets.all(paddingValue),
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeInOut,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.pinkAccent.shade100,
                    ),
                  ),
                ],
              ),
            ),
            CodeDisplay(text: MyCodes().animatedPadding)
          ],
        ),
      ),
    );
  }
}

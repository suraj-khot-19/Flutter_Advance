import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class FlutterAbsorbPointer extends StatelessWidget {
  const FlutterAbsorbPointer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Absorb Pointer"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 100,
                      child: ElevatedButton(
                        // clikable
                        onPressed: () {},
                        child: null,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 200,
                      //creates a widget that absorbs pointers during hit testing.
                      child: AbsorbPointer(
                        //not clickable
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white30),
                          onPressed: () {},
                          child: null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CodeDisplay(text: MyCodes().absorbPointer)
          ],
        ),
      ),
    );
  }
}

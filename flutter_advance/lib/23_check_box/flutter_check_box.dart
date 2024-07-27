import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class FlutterCheckBox extends StatefulWidget {
  const FlutterCheckBox({super.key});

  @override
  State<FlutterCheckBox> createState() => _FlutterCheckBoxState();
}

class _FlutterCheckBoxState extends State<FlutterCheckBox> {
  bool? isCheckedMale = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check box"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white12,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(12),
              child: Checkbox(
                value: isCheckedMale,
                activeColor: Colors.purple,
                tristate:
                    true, //?If true the checkbox's [value] can be true, false, or null.
                onChanged: (value) {
                  setState(() {
                    isCheckedMale = value;
                  });
                },
              ),
            ),
            CodeDisplay(text: MyCodes().checkBox)
          ],
        ),
      ),
    );
  }
}

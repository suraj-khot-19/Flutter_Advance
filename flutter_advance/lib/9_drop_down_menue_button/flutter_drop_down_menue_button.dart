import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class FlutterDropDownMenueButton extends StatefulWidget {
  const FlutterDropDownMenueButton({super.key});

  @override
  State<FlutterDropDownMenueButton> createState() =>
      _FlutterDropDownMenueButtonState();
}

class _FlutterDropDownMenueButtonState
    extends State<FlutterDropDownMenueButton> {
  //list
  List<String> items = [
    "suraj",
    "khot",
    "santosh",
    "aryan",
    "rohan",
  ];
  //initally
  String selectedValue = "suraj";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Drop Down Menue Button",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  DropdownButton<String>(
                    //initial value
                    value: selectedValue,
                    //items
                    items: items
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            //need to add value here
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    //on cahnged seting state with new value
                    onChanged: (String? newvalue) {
                      setState(() {
                        selectedValue = newvalue!;
                      });
                    },
                    //color
                    dropdownColor: const Color.fromARGB(255, 76, 101, 175),
                    //expanded
                    isExpanded: true,
                    //radius
                    borderRadius: BorderRadius.circular(20),
                    //other
                    icon: const Icon(Icons.swipe_left),
                    underline: Container(
                      height: 2,
                      color: Colors.red,
                    ),
                    padding: const EdgeInsets.all(20),
                    // menuMaxHeight: 30,
                    // isDense: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  selectedValue.isNotEmpty
                      ? Text(
                          "Hello, $selectedValue",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      : const Text(""),
                ],
              ),
            ),
            CodeDisplay(text: MyCodes().dropDownMenueButton)
          ],
        ),
      ),
    );
  }
}

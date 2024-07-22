import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class FlutterAutoComplete extends StatelessWidget {
  const FlutterAutoComplete({super.key});
  static const List<String> list = [
    "suraj",
    "google",
    "khot",
    "apple",
    "sonya",
    "shubh",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auto Complete"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // color: Colors.white24,
              margin: const EdgeInsets.all(30),
              child: Autocomplete<String>(
                //A function that returns the current selectable options objects given the current TextEditingValue.
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == "") {
                    //Creates an empty iterable.The empty iterable has no elements, and iterating it always stops immediately.
                    return const Iterable<String>.empty();
                  }
                  //Creates a new lazy [Iterable] with all elements that satisfy the predicate [test].The matching elements have the same order in the returned iterable as they have in [iterator].
                  return list.where((String value) {
                    //Whether the collection contains an element equal to [element].This operation will check each element in order for being equal to [element], unless it has a more efficient way to find an element equal to [element]. Stops iterating on the first equal element.
                    return value.contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (option) {
                  debugPrint(option);
                },
                initialValue: TextEditingValue(text: list[0]),
              ),
            ),
            CodeDisplay(text: MyCodes().autoComplete)
          ],
        ),
      ),
    );
  }
}

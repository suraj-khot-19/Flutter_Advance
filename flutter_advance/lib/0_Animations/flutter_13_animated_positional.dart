import 'package:flutter/material.dart';

class Flutter13AnimatedPositional extends StatefulWidget {
  const Flutter13AnimatedPositional({super.key});

  @override
  State<Flutter13AnimatedPositional> createState() =>
      _Flutter13AnimatedPositionalState();
}

class _Flutter13AnimatedPositionalState
    extends State<Flutter13AnimatedPositional> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Positioed"),
      ),
      body: Stack(
        children: [
          /*
          Creates a widget that animates its position implicitly.
Only two out of the three horizontal values ([left], [right], [width]), 
and only two out of the three vertical values ([top], [bottom], [height]),
 can be set. In each case, at least one of the three must be null.
          */
          AnimatedPositioned(
            //posi
            top: isSelected ? 10 : 30,
            right: isSelected ? 60 : 150,
            duration: const Duration(seconds: 1),
            child: Container(
              height: isSelected ? 50 : 150,
              width: isSelected ? 150 : 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(isSelected ? 50 : 30),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: const Center(child: Text("click me!")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

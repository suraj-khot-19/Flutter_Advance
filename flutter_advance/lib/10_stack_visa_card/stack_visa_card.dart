import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class StackVisaCard extends StatelessWidget {
  const StackVisaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 15, 205, 100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: Image.asset(
                      "assets/1719892890657.png",
                      height: 30,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Positioned(
                    top: 80,
                    left: 32,
                    child: Text(
                      "it's where you want to be",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const Positioned(
                    bottom: 45,
                    left: 32,
                    child: Text(
                      "9432  1123  9966  4555",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 17,
                    left: 32,
                    child: Text(
                      "SURAJ KHOT",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Times'),
                    ),
                  ),
                  Positioned(
                    right: -120,
                    left: 200,
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Positioned(
                    /*
                  The child's width.
              Only two out of the three horizontal values ([left], [right], [width]) can be set. The third must be null.
              If all three are null, the [Stack.alignment] is used to position the child horizontally.
                   */
                    width: 500,
                    bottom: -380,
                    left: -100,
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 30,
                    child: Image.asset(
                      "assets/1719892890649.png",
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            CodeDisplay(text: MyCodes().stack)
          ],
        ),
      ),
    );
  }
}

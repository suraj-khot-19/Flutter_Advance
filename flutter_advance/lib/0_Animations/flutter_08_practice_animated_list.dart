import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class Flutter08PracticeAnimatedList extends StatefulWidget {
  const Flutter08PracticeAnimatedList({super.key});

  @override
  State<Flutter08PracticeAnimatedList> createState() =>
      _Flutter08PracticeAnimatedListState();
}

class _Flutter08PracticeAnimatedListState
    extends State<Flutter08PracticeAnimatedList> {
  final _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  Timer? timer;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_items.length >= 10) {
        timer.cancel();
      } else {
        addItems();
      }
    });
  }

  void addItems() {
    _items.insert(0, "Item ${_items.length + 1}");
    _key.currentState!.insertItem(
      0,
      duration: const Duration(seconds: 2),
    );
  }

  void removeItem(int index) {
    _key.currentState!.removeItem(
      index,
      (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            color: Colors.red,
            child: ListTile(
              title: Text("Deleted"),
            ),
          ),
        );
      },
      duration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practice animated list"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedList(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              key: _key,
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: Card(
                    color: Colors.cyanAccent,
                    child: ListTile(
                      title: Text(
                        _items[index],
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      leading: Badge(
                        label: Text(
                          index.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Icon(
                          Icons.blur_circular_rounded,
                          color: Colors.black,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => removeItem(index),
                        icon: const Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            CodeDisplay(text: MyCodes().animatedListPractice),
          ],
        ),
      ),
    );
  }
}

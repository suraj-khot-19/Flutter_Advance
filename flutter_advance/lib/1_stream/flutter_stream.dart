import 'dart:async';
import 'package:flutter/material.dart';

class FlutterStream extends StatefulWidget {
  const FlutterStream({super.key});

  @override
  State<FlutterStream> createState() => _FlutterStreamState();
}

class _FlutterStreamState extends State<FlutterStream> {
  TextEditingController textEditingController = TextEditingController();
  String texting = "";
  StreamController<String> streamController = StreamController<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single Stream"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /**
             * showing real time text 
             * using streamBuilder 
             */
            StreamBuilder<String>(
              // stream =>*output
              // sink =>*input
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? "Null Data");
                } else {
                  return const Text("no data");
                }
              },
            ),
            SizedBox(
              width: 80,
              child: TextField(
                controller: textEditingController,
                onChanged: (value) {
                  setState(() {
                    texting = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                streamController.add(textEditingController.text);
              },
              child: const Text("Done"),
            ),
            const SizedBox(
              height: 100,
            ),
            /*
            without using stream we 
            just use onChanged() in
            textfeild with setState()
             */
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white10,
              ),
              child: texting.isNotEmpty
                  ? Text("You Entered: $texting")
                  : const Text("Please enter text in textfeild"),
            ),
          ],
        ),
      ),
    );
  }
}

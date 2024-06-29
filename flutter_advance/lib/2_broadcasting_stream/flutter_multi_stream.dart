import 'dart:async';

import 'package:flutter/material.dart';

class FlutterMultiStream extends StatefulWidget {
  const FlutterMultiStream({super.key});

  @override
  State<FlutterMultiStream> createState() => _FlutterMultiStreamState();
}

class _FlutterMultiStreamState extends State<FlutterMultiStream> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<String> streamController = StreamController<String>();
//using late to create stream
  late Stream<String> _stream;
  @override
  void initState() {
    super.initState();
    //creating broadcasting strean
    _stream = streamController.stream.asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi streams"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              // passing broadbrand stream
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? "Null Data");
                } else {
                  return const Text("No Data");
                }
              },
            ),
            StreamBuilder<String>(
              // passing broadbrand stream
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? "Null Data");
                } else {
                  return const Text("No Data");
                }
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 80,
              child: TextField(
                controller: textEditingController,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                streamController.add(textEditingController.text);
              },
              child: const Text("Done"),
            ),
          ],
        ),
      ),
    );
  }
}

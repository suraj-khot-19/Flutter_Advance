import 'package:flutter/material.dart';

class Archived extends StatefulWidget {
  final List<String> archived;
  const Archived({super.key, required this.archived});

  @override
  State<Archived> createState() => _ArchivedState();
}

class _ArchivedState extends State<Archived> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Archived"),
      ),
      body: ListView.builder(
        itemCount: widget.archived.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(15),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.grey,
              ),
              title: Text(widget.archived[index]),
            ),
          );
        },
      ),
    );
  }
}

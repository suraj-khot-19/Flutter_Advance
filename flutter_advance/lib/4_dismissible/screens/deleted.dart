import 'package:flutter/material.dart';
import 'package:flutter_advance/4_dismissible/widget/background_for_dis.dart';

class Deleted extends StatefulWidget {
  final List<String> deleted;
  final List<String> emails;
  const Deleted({
    super.key,
    required this.deleted,
    required this.emails,
  });

  @override
  State<Deleted> createState() => _DeletedState();
}

class _DeletedState extends State<Deleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deleted"),
      ),
      body: ListView.builder(
        itemCount: widget.deleted.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(15),
            child: Dismissible(
              background: const BackgroundForDis(
                color: Colors.green,
                icon: Icons.undo_outlined,
                isLeft: true,
              ),
              secondaryBackground: const BackgroundForDis(
                  color: Colors.green, icon: Icons.undo_outlined),
              key: Key(widget.emails[index]),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                String deletedString = widget.deleted[index];
                setState(() {
                  widget.emails.insert(index, deletedString);
                  widget.deleted.remove(deletedString);
                });
                Navigator.pop(context, true);
              },
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text(widget.deleted[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

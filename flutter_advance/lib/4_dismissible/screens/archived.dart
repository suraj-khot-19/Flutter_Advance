import 'package:flutter/material.dart';
import 'package:flutter_advance/4_dismissible/widget/background_for_dis.dart';

class Archived extends StatefulWidget {
  final List<String> archived;
  final List<String> emails;
  const Archived({super.key, required this.archived, required this.emails});

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
            child: Dismissible(
              background: const BackgroundForDis(
                color: Colors.green,
                icon: Icons.undo_outlined,
                isLeft: true,
              ),
              secondaryBackground: const BackgroundForDis(
                  color: Colors.green, icon: Icons.undo_outlined),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                final String undoArchivedString = widget.archived[index];
                setState(() {
                  widget.emails.insert(index, undoArchivedString);
                  widget.archived.remove(undoArchivedString);
                });
                Navigator.pop(context, true);
              },
              key: Key(widget.emails[index]),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text(widget.archived[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

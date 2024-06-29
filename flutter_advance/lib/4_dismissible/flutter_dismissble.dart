import 'package:flutter/material.dart';
import 'package:flutter_advance/4_dismissible/screens/archived.dart';
import 'package:flutter_advance/4_dismissible/screens/deleted.dart';
import 'package:flutter_advance/4_dismissible/widget/container_with_title.dart';

class FlutterDismissble extends StatefulWidget {
  const FlutterDismissble({super.key});

  @override
  State<FlutterDismissble> createState() => _FlutterDismissbleState();
}

class _FlutterDismissbleState extends State<FlutterDismissble>
    with SingleTickerProviderStateMixin {
  List<String> emails = [
    "Angle-one",
    "suk",
    "Angle-one",
    "suk",
    "Angle-one",
    "suk",
    "Angle-one",
    "suk",
  ];
  List<String> archived = [];
  List<String> deleted = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dissmisable"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Deleted(
                              deleted: deleted,
                              emails: emails,
                            ))),
                child: const ContainerWithTitle(
                  title: "Deleted",
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Archived(archived: archived))),
                child: const ContainerWithTitle(
                  title: "Archived",
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: emails.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Dismissible(
                    key: Key(emails[index]),
                    //background for left->right
                    background: Container(
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.archive_outlined)),
                    ),
                    //background for right -> left
                    secondaryBackground: Container(
                      padding: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 17, 0),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.delete_forever_outlined)),
                    ),
                    onDismissed: (direction) {
                      String removedEmail = emails[index];
                      setState(() {
                        emails.removeAt(index);
                      });
                      //left->right
                      if (direction == DismissDirection.startToEnd) {
                        setState(() {
                          archived.add(removedEmail);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 3),
                            content: Text(
                              "${emails[index]} archived",
                              style: const TextStyle(color: Colors.white),
                            ),
                            action: SnackBarAction(
                                label: "Undo",
                                onPressed: () {
                                  setState(() {
                                    emails.insert(index, removedEmail);
                                    archived.remove(removedEmail);
                                  });
                                }),
                          ),
                        );
                      }
                      //right to left
                      if (direction == DismissDirection.endToStart) {
                        setState(() {
                          deleted.add(removedEmail);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            backgroundColor: Colors.red,
                            content: Text(
                              "${emails[index]} deleted",
                              style: const TextStyle(color: Colors.black),
                            ),
                            action: SnackBarAction(
                                label: "Undo",
                                onPressed: () {
                                  setState(() {
                                    emails.insert(index, removedEmail);
                                    deleted.remove(removedEmail);
                                  });
                                }),
                          ),
                        );
                      }
                    },

                    ///returning
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(emails[index].toString()),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

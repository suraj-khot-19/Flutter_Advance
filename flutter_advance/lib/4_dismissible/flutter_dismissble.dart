import 'package:flutter/material.dart';
import 'package:flutter_advance/4_dismissible/screens/archived.dart';
import 'package:flutter_advance/4_dismissible/screens/deleted.dart';
import 'package:flutter_advance/4_dismissible/widget/background_for_dis.dart';
import 'package:flutter_advance/4_dismissible/widget/container_with_title.dart';

class FlutterDismissble extends StatefulWidget {
  const FlutterDismissble({super.key});

  @override
  State<FlutterDismissble> createState() => _FlutterDismissbleState();
}

class _FlutterDismissbleState extends State<FlutterDismissble> {
  List<String> emails = [
    "figma",
    "noreplay",
    "Angle-one",
    "suk",
    "suraj",
    "kle",
    "dmat",
    "khot"
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
                onTap: () async {
                  //rebuilding UI when Navigate to screen
                  bool result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Deleted(
                                deleted: deleted,
                                emails: emails,
                              )));
                  if (result == true) {
                    setState(() {});
                  }
                },
                child: const ContainerWithTitle(
                  title: "Deleted",
                ),
              ),
              InkWell(
                onTap: () async {
                  //rebuilding UI when Navigate to screen
                  bool result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Archived(
                        archived: archived,
                        emails: emails,
                      ),
                    ),
                  );
                  if (result == true) {
                    setState(() {});
                  }
                },
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
                    background: const BackgroundForDis(
                      color: Colors.green,
                      icon: Icons.archive_outlined,
                      isLeft: true,
                    ),
                    //secoundry background
                    secondaryBackground: const BackgroundForDis(
                      color: Color.fromARGB(255, 255, 17, 0),
                      icon: Icons.delete_forever_outlined,
                    ),
                    //function when dissmessed occurs
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

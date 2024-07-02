class MyCodes {
  String stream1 = '''
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
                  ? Text("You Entered: \$texting")
                  : const Text("Please enter text in textfeild"),
            ),
          ],
        ),
      ),
    );
  }
}

''';
  String stream2 = '''
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
''';
  String snackbar = '''
import 'package:flutter/material.dart';

class FlutterSnackBar extends StatelessWidget {
  const FlutterSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snack Bar"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //defining snackbar
                final snackbar = SnackBar(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 5),
                  showCloseIcon: true,
                  margin: const EdgeInsets.all(20),
                  action: SnackBarAction(label: "close", onPressed: () {}),
                  content: const Text(
                    "My Snack Bar",
                  ),
                );
                //showing it using ScaffoldMessenger
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
              child: const Text("SnackBar"),
            ),
          ],
        ),
      ),
    );
  }
}

''';
  String dismissible1 = '''
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
                              "\${emails[index]} archived",
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
                              "\${emails[index]} deleted",
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

''';
  String dismissble2 = '''
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

''';
  String dismissble3 = '''
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

''';
  String dismissble4 = '''
import 'package:flutter/material.dart';

class BackgroundForDis extends StatelessWidget {
  final Color color;
  final IconData icon;
  final bool isLeft;
  const BackgroundForDis(
      {super.key,
      required this.color,
      required this.icon,
      this.isLeft = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isLeft
          ? const EdgeInsets.only(left: 8)
          : const EdgeInsets.only(right: 8),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Align(
        alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
        child: Icon(icon),
      ),
    );
  }
}

''';
  String dismissble5 = '''
import 'package:flutter/material.dart';

class ContainerWithTitle extends StatelessWidget {
  final String title;
  const ContainerWithTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(10)),
      child: Text(title),
    );
  }
}

''';
  String alertdialog = '''
import 'package:flutter/material.dart';
import 'package:flutter_advance/home.dart';

class FlutterAlertDialog extends StatelessWidget {
  const FlutterAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    void showing() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              //title
              title: const Text("Alert Dialog Box"),
              //background
              backgroundColor: Colors.pink,
              //content
              content: const Text("This is Content"),
              //actions
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Close")),
                TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      )),
                  child: const Text("Home"),
                ),
              ],
              //icon top
              icon: const Icon(Icons.flutter_dash_outlined),
              //padding to content
              contentPadding: const EdgeInsets.all(20),
              //padding to action
              actionsPadding: const EdgeInsets.all(20),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Dialog"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showing(),
          child: const Text("Tap"),
        ),
      ),
    );
  }
}

''';
  String bottomsheet = '''
import 'package:flutter/material.dart';

class FlutterBottomSheet extends StatelessWidget {
  const FlutterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Sheet"),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 194, 72, 189),
        child: Center(
          child: ElevatedButton.icon(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                //bg
                backgroundColor: Colors.indigo,
                //shape and border
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                //if click outside dont pop
                isDismissible: false,
                //putting color outside
                barrierColor: Colors.black.withOpacity(0.4),
                builder: (context) {
                  return const Column(
                    //make it to take as as less as possible
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text("suraj"),
                        subtitle: Text("Khot"),
                      ),
                      ListTile(
                        title: Text("adarsh"),
                        subtitle: Text("pujari"),
                      ),
                      ListTile(
                        title: Text("sohan"),
                        subtitle: Text("patil"),
                      ),
                      ListTile(
                        title: Text("shubh"),
                        subtitle: Text("hande"),
                      ),
                    ],
                  );
                },
              );
            },
            label: const Text("tap"),
          ),
        ),
      ),
    );
  }
}
''';
  String animatedList = '''
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class FlutterAnimatedText extends StatelessWidget {
  const FlutterAnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Text"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fade and scale Animated
                const Text("1. Fade and scale Animated text"),
                SizedBox(
                  height: 60,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    // totalRepeatCount: 10,
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                    animatedTexts: [
                      FadeAnimatedText('Fade First'),
                      ScaleAnimatedText('then Scale'),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                
                //TypewriterAnimatedText
                const Text("2. Type writerAnimatedText"),
                SizedBox(
                  height: 60,
                  child: AnimatedTextKit(
                    stopPauseOnTap: true,
                    isRepeatingAnimation: true,
                    // totalRepeatCount: 10,
                    animatedTexts: [
                      TypewriterAnimatedText("Type Writer Animated Text")
                    ],
                  ),
                ),
                const SizedBox(height: 30),


                //FlickerAnimatedText
                const Text("3. FlickerAnimatedText"),
                SizedBox(
                  height: 60,
                  child: AnimatedTextKit(
                    stopPauseOnTap: true,
                    // isRepeatingAnimation: true,
                    repeatForever: true,
                    // totalRepeatCount: 10,
                    animatedTexts: [
                      FlickerAnimatedText(
                        "Flicker Animated Text",
                        speed: const Duration(seconds: 1),
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),


                //RotateAnimatedText
                const Text("4. RotateAnimatedText"),
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Stady Text"),
                      const SizedBox(width: 3),
                      AnimatedTextKit(
                        animatedTexts: [
                          RotateAnimatedText("Rotate"),
                          RotateAnimatedText("Animated"),
                          RotateAnimatedText("Text"),
                        ],
                      ),
                    ],
                  ),
                ),


                //WavyAnimatedText
                const SizedBox(height: 30),
                const Text("4. WavyAnimatedText"),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    WavyAnimatedText("wavy Animated Text"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
''';
  String bottomNav = '''
import 'package:flutter/material.dart';
import 'package:flutter_advance/8_bottom_navigation_bar/screens/account_screen.dart';
import 'package:flutter_advance/8_bottom_navigation_bar/screens/code_screen.dart';
import 'package:flutter_advance/8_bottom_navigation_bar/screens/home_screen.dart';
import 'package:flutter_advance/8_bottom_navigation_bar/screens/setting_screen.dart';

class FlutterBottomNavigation extends StatefulWidget {
  const FlutterBottomNavigation({super.key});

  @override
  State<FlutterBottomNavigation> createState() =>
      _FlutterBottomNavigationState();
}

class _FlutterBottomNavigationState extends State<FlutterBottomNavigation> {
//list of widgets
  final List<Widget> _list = [
    const CodeScreen(),
    const Home(),
    const SettingScreen(),
    const AccountScreen(),
  ];
  //currnet index
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Nav Bar"),
      ),
      body: _list[selected],
      bottomNavigationBar: BottomNavigationBar(
        //type
        type: BottomNavigationBarType.fixed,
        // type: BottomNavigationBarType.shifting, which shitft when select
        //on tap changing state with selected
        onTap: (value) {
          setState(() {
            selected = value;
          });
        },
        //bg
        backgroundColor: Colors.pink.withOpacity(0.2),
        //index
        currentIndex: selected,
        //other
        showSelectedLabels: false,
        showUnselectedLabels: false,
        enableFeedback: true,
        selectedIconTheme: const IconThemeData(color: Colors.green),

        items: const [
          //0
          BottomNavigationBarItem(
            tooltip: "Code",
            icon: Icon(Icons.code),
            label: "Code",
          ),
          //1
          BottomNavigationBarItem(
            //when long press
            tooltip: "Home",
            // icon
            icon: Icon(
              Icons.home,
            ),
            // label
            label: "home",
          ),
          //2
          BottomNavigationBarItem(
            tooltip: "Setting",
            icon: Icon(Icons.settings),
            label: "setting",
          ),
          //3
          BottomNavigationBarItem(
            tooltip: "Account",
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
      ),
    );
  }
}

''';
  String dropDownMenueButton = '''
import 'package:flutter/material.dart';

class FlutterDropDownMenueButton extends StatefulWidget {
  const FlutterDropDownMenueButton({super.key});

  @override
  State<FlutterDropDownMenueButton> createState() =>
      _FlutterDropDownMenueButtonState();
}

class _FlutterDropDownMenueButtonState
    extends State<FlutterDropDownMenueButton> {
  //list
  List<String> items = [
    "suraj",
    "khot",
    "santosh",
    "aryan",
    "rohan",
  ];
  //initally
  String selectedValue = "suraj";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Drop Down Menue Button",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            DropdownButton<String>(
              //initial value
              value: selectedValue,
              //items
              items: items
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      //need to add value here
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              //on cahnged seting state with new value
              onChanged: (String? newvalue) {
                setState(() {
                  selectedValue = newvalue!;
                });
              },
              //color
              dropdownColor: const Color.fromARGB(255, 76, 101, 175),
              //expanded
              isExpanded: true,
              //radius
              borderRadius: BorderRadius.circular(20),
              //other
              icon: const Icon(Icons.swipe_left),
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              padding: const EdgeInsets.all(20),
              // menuMaxHeight: 30,
              // isDense: true,
            ),
             selectedValue.isNotEmpty
                      ? Text(
                          "Hello, \$selectedValue",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      : const Text(""),
          ],
        ),
      ),
    );
  }
}
''';

  String stack = '''

import 'package:flutter/material.dart';

class StackVisaCard extends StatelessWidget {
  const StackVisaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack"),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
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
      ),
    );
  }
}
''';
}

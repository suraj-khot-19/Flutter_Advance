import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';
import 'package:image_picker/image_picker.dart';

class FlutterCarusalSlider extends StatefulWidget {
  const FlutterCarusalSlider({super.key});

  @override
  State<FlutterCarusalSlider> createState() => _FlutterCarusalSliderState();
}

class _FlutterCarusalSliderState extends State<FlutterCarusalSlider> {
  List<XFile>? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carusal Slider"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              color: Colors.amber.withOpacity(0.2),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      color: Colors.white24,
                      height: 400,
                      width: 500,
                      child: file == null
                          ? const Center(
                              child: Text("Pick Images"),
                            )
                          : Slider(items: file!),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final List<XFile> photos =
                          await ImagePicker().pickMultiImage();
                      setState(() {
                        file = photos;
                      });
                    },
                    child: const Text("Pick Images"),
                  ),
                ],
              ),
            ),
            CodeDisplay(text: MyCodes().crousalSlider),
            CodeDisplay(text: MyCodes().crousalSlider2),
          ],
        ),
      ),
    );
  }
}

//CarouselSlider
class Slider extends StatefulWidget {
  final List<XFile> items;
  const Slider({super.key, required this.items});

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  //method to show image big
  void showImage(XFile img) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Image.file(
            height: 420,
            width: 600,
            File(img.path),
            fit: BoxFit.cover,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
            TextButton(
              onPressed: () {
                //removing image at object
                setState(() {
                  widget.items.remove(img);
                });
                Navigator.pop(context);
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.items
          .map(
            (images) => Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showImage(images);
                        },
                        child: Image.file(
                          height: 400,
                          File(images.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: IconButton(
                          onPressed: () {
                            //removing image at object
                            setState(() {
                              widget.items.remove(images);
                            });
                          },
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 250,
        enableInfiniteScroll: false,
      ),
    );
  }
}

import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';
import 'package:image_picker/image_picker.dart';

/*
dependencies:
  flutter:
  image_picker:
  carousel_slider:
 */

class FlutterImagePicker extends StatefulWidget {
  const FlutterImagePicker({super.key});

  @override
  State<FlutterImagePicker> createState() => _FlutterImagePickerState();
}

class _FlutterImagePickerState extends State<FlutterImagePicker> {
  //x file for any cross paltform file type
  XFile? file;
  XFile? fileCam;
  List<XFile>? fileList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image picker"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(30),
              color: Colors.amber.withOpacity(0.30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //single image gallary
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      color: Colors.white10,
                      height: 200,
                      width: 200,
                      child: file == null
                          ? const Center(
                              child: Text("No Image Picked!"),
                            )
                          //convering XFILE? to File
                          : Image.file(
                              File(file!.path),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final XFile? photo = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      setState(() {
                        file = photo;
                      });
                    },
                    child: const Text("Pick Single Image"),
                  ),

                  //single image camera
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      color: Colors.white10,
                      height: 200,
                      width: 200,
                      child: fileCam == null
                          ? const Center(
                              child: Text("No Image Picked!"),
                            )
                          //convering XFILE? to File
                          : Image.file(
                              File(fileCam!.path),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final XFile? photo = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      setState(() {
                        fileCam = photo;
                      });
                    },
                    child: const Text("Pick Image from camera"),
                  ),

                  //multi images
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      height: 200,
                      width: 200,
                      color: Colors.white24,
                      child: fileList == null
                          ? const Center(
                              child: Text("Image not picked"),
                            )
                          //displaying images using   carousel_slider: package
                          : slider(fileList!),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final List<XFile> photListFile =
                          await ImagePicker().pickMultiImage();
                      setState(() {
                        fileList = photListFile;
                      });
                    },
                    child: const Text("Pick Multi Image"),
                  )
                ],
              ),
            ),
            CodeDisplay(text: MyCodes().imagePick)
          ],
        ),
      ),
    );
  }
}

Widget slider(List<XFile> items) {
  return CarouselSlider(
    items: items
        .map(
          (image) => Builder(
            builder: (context) {
              return Image.file(
                File(image.path),
                fit: BoxFit.cover,
              );
            },
          ),
        )
        .toList(),
    options: CarouselOptions(
      height: 200,
      enableInfiniteScroll: false,
    ),
  );
}

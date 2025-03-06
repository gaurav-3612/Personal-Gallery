import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_app/main.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:photo_gallery/photo_gallery.dart';

class ViewPage extends StatefulWidget {
  Medium medium;
  ViewPage(this.medium);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  late ImageLabeler imageLabeler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImageFile();

    ImageLabelerOptions options = ImageLabelerOptions(confidenceThreshold: 0.5);
    imageLabeler = ImageLabeler(options: options);
  }

  File? imageFile;
  loadImageFile() async {
    imageFile = await this.widget.medium.getFile();

    performImageLabelling();
    setState(() {
      imageFile;
    });
  }

  performImageLabelling() async {
    InputImage inputImage = InputImage.fromFile(imageFile!);

    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    for (ImageLabel label in labels) {
      final String text = label.label;
      final int index = label.index;
      final double confidence = label.confidence;

      print(
        text + "        " + confidence.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.pink.shade100,
        title: Text(
          this.widget.medium.filename.toString(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: mq.height * .05,
              left: mq.width * .05,
              right: mq.width * .05),
          child: Center(
            child: imageFile != null ? Image.file(imageFile!) : Container(),
          ),
        ),
      ),
    );
  }
}

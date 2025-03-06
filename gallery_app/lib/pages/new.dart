import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';

class New extends StatefulWidget {
  const New({super.key});

  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
  File? image;
  late ImagePicker imagePicker;
  late ImageLabeler imageLabeler;

  void initState() {
    super.initState();

    imagePicker = ImagePicker();

    ImageLabelerOptions options = ImageLabelerOptions(confidenceThreshold: 0.5);
    imageLabeler = ImageLabeler(options: options);
  }

  captureImage() async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (selectedImage != null) {
      image = File(selectedImage.path);
      performImageLabelling();

      setState(() {
        image;
      });
    }
  }

  performImageLabelling() async {
    InputImage inputImage = InputImage.fromFile(image!);

    final List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    for (ImageLabel label in labels) {
      final String text = label.label;
      final int index = label.index;
      final double confidence = label.confidence;

      print(text + "        " + confidence.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: image == null
                  ? Icon(
                      Icons.image,
                      size: 150,
                    )
                  : Image.file(image!),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: captureImage,
                  icon: Icon(
                    Icons.camera,
                    size: 50,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

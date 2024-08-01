import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:selectcropcompressimage/selectcropcompressimage.dart';

void main(List<String> args) {
  runApp(const SelectCropCompressImageExampleApp());
}

class SelectCropCompressImageExampleApp extends StatelessWidget {
  const SelectCropCompressImageExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectCropCompressImageScreen(),
    );
  }
}

class SelectCropCompressImageScreen extends StatelessWidget {
  const SelectCropCompressImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("SelectCropCompressImage"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                SelectCropCompressImage selectCropCompressImage = SelectCropCompressImage();
                Uint8List? selectedCroppedAndCompressImage = await selectCropCompressImage.selectCropCompressImageFromGallery(
                  compressionAmount: 30,
                  context: context,
                  title: "SelectCropCompressApp",
                );
                if (selectedCroppedAndCompressImage != null) {
                  //Do something with the image
                } else {
                  //Discard...
                }
              },
              child: const Text("Select from Gallery"),
            ),
            ElevatedButton(
              onPressed: () async {
                SelectCropCompressImage selectCropCompressImage = SelectCropCompressImage();
                Uint8List? selectedCroppedAndCompressImage = await selectCropCompressImage.selectCropCompressImageFromCamera(
                  compressionAmount: 30,
                  context: context,
                  title: "SelectCropCompressApp",
                );
                if (selectedCroppedAndCompressImage != null) {
                  //Do something with the image
                } else {
                  //Discard...
                }
              },
              child: const Text("Take a photo"),
            ),
          ],
        ),
      ),
    );
  }
}

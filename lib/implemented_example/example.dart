import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:selectcropcompressimage/selectcropcompressimage.dart';

Future getImage() async {
  SelectCropCompressImage selectCropCompressImage = SelectCropCompressImage();
  Uint8List? selectedCroppedAndCompressImage =
      await selectCropCompressImage.selectCropCompressImage(
    imageSource: ImageSource.gallery,
    compressionAmount: 70,
  );
  if (selectedCroppedAndCompressImage != null) {
    //Do something with the image
  } else {
    //Discard...
  }
}

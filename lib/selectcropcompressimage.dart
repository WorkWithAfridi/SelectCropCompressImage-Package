import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SelectCropCompressImage {
  Future<Uint8List?> selectCropCompressImageFromGallery({
    required int compressionAmount,
    int aspectRatioX = 1,
    int aspectRatioY = 1,
  }) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? selectedImageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (selectedImageFile != null) {
      CroppedFile croppedImageFile = await _cropImage(
        selectedImageFile: selectedImageFile,
        aspectRatioX: aspectRatioX,
        aspectRatioY: aspectRatioY,
      );
      Uint8List croppedAndCompressedImage = _compressImage(
        croppedImageFile: croppedImageFile,
        compressionAmount: compressionAmount,
      );
      return croppedAndCompressedImage;
    }
    return null;
  }

  Future<Uint8List?> selectCropCompressImageFromCamera({
    required int compressionAmount,
    int aspectRatioX = 1,
    int aspectRatioY = 1,
  }) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? selectedImageFile = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (selectedImageFile != null) {
      CroppedFile croppedImageFile = await _cropImage(
        selectedImageFile: selectedImageFile,
        aspectRatioX: aspectRatioX,
        aspectRatioY: aspectRatioY,
      );
      Uint8List croppedAndCompressedImage = _compressImage(
        croppedImageFile: croppedImageFile,
        compressionAmount: compressionAmount,
      );
      return croppedAndCompressedImage;
    }
    return null;
  }

  _cropImage({
    required XFile selectedImageFile,
    required int aspectRatioX,
    required int aspectRatioY,
  }) async {
    return await ImageCropper().cropImage(
      sourcePath: selectedImageFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    );
  }

  _compressImage({
    required CroppedFile croppedImageFile,
    required int compressionAmount,
  }) async {
    int quality;
    if (compressionAmount < 100) {
      quality = 100 - compressionAmount;
    } else {
      quality = 100;
    }
    return await FlutterImageCompress.compressWithFile(
      croppedImageFile.path,
      quality: quality,
    );
  }
}

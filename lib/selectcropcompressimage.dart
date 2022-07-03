import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SelectCropCompressImage {
  Future<Uint8List?> selectCropCompressImageFromGallery({
    required int compressionAmount,
    required BuildContext context,
    int aspectRatioX = 1,
    int aspectRatioY = 1,
  }) async {
    return await _selectCropCompressImage(
      imageSource: ImageSource.gallery,
      context: context,
      compressionAmount: compressionAmount,
      aspectRatioX: aspectRatioX,
      aspectRatioY: aspectRatioY,
    );
  }

  Future<Uint8List?> selectCropCompressImageFromCamera({
    required int compressionAmount,
    required BuildContext context,
    int aspectRatioX = 1,
    int aspectRatioY = 1,
  }) async {
    return await _selectCropCompressImage(
      imageSource: ImageSource.camera,
      context: context,
      compressionAmount: compressionAmount,
      aspectRatioX: aspectRatioX,
      aspectRatioY: aspectRatioY,
    );
  }

  Future<Uint8List?> _selectCropCompressImage({
    required ImageSource imageSource,
    required int compressionAmount,
    required BuildContext context,
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
        context: context,
      );
      Uint8List croppedAndCompressedImage = await _compressImage(
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
    required BuildContext context,
  }) async {
    return await ImageCropper().cropImage(
      sourcePath: selectedImageFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Image Cropper',
          toolbarColor: Theme.of(context).primaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
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

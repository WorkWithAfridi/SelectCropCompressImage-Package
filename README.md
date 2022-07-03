# SelectCropCompressImage

## A package to select, crop and compress images all through one call.

A package to select, crop and compress images all through one call.A package to select, crop and compress images all through one call. Image selection is done via Image Picker package, Image Cropping is achieved through the Image Copper package and finally the compression is done using the Flutter Image Compress package.

## Features

- Image Selection
- Image Cropping
- Image Compression

## Getting started 

* Import this package!
* (FOR ANDROID ONLY) Add the following lines of code in your android manifest file. 

````xml
    <activity
        android:name="com.yalantis.ucrop.UCropActivity"
        android:screenOrientation="portrait"
        android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
````

* (FOR iOS, no further configurations needed!)
* Create instance of the SelectCropCompressImage class and call the selectCropCompressImage function with the required parameters passed! And thats it!! :D

### Required parameters

* **imageSource**: the absolute source of an image. Gallery / Camera
* **compressionAmount**: the amount of compression the image will go through before returning.

### Optional parameters

* **aspectRatioX**: the X axis AspectRatio for image cropping. Default is 1.
* **aspectRatioY**: the Y axis AspectRatio for image cropping. Default is 1.

## Additional information

* Links to the packages used in this project.
* Image Picker ^0.8.5+3 : https://pub.dev/packages/image_picker
* Image Cropper ^2.0.3 : https://pub.dev/packages/image_cropper
* Flutter Image Compress ^1.1.0 : https://pub.dev/packages/flutter_image_compress

**The CompressionAmount needs to be in a range of 0-100. Otherwise the default compression amount will be used, which is 0.

## Example

````dart

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

````

** View in file at implemented_example/example.dart

### Note

* The result file is saved in `NSTemporaryDirectory` on iOS and application Cache directory on Android, so it can be lost later, you are responsible for storing it somewhere permanent (if needed).



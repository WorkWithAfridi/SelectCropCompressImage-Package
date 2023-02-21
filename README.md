# SelectCropCompressImage

## "SelectCropCompressImage" is a useful Flutter package that simplifies the process of selecting, cropping, and compressing images for use within the app, without requiring users to leave the app or use other third-party tools.

"SelectCropCompressImage" is a Flutter package that provides the functionality for users to select an image from their phone's gallery or capture an image through their phone camera within the app. The package allows the user to crop the image according to their preference and finally compress the image before importing it to the app.

Upon importing the package, users can easily access the image selection feature with a simple call to the package's function. The package provides a user-friendly interface that allows users to select an image from their gallery or capture a new image using their phone's camera.

Once the user has selected or captured an image, the package provides a cropping feature that enables the user to adjust the dimensions of the image to their liking. The user can adjust the height and width of the image or choose a predefined aspect ratio.

After cropping the image, the package allows the user to compress the image to reduce its size. The compression feature allows users to choose the level of compression to be applied to the image, depending on the app's preference and requirements.

Finally, the compressed image can be imported into the app and used as required. The package ensures that the imported image is of the highest quality possible while maintaining a small size, allowing the app to load and display the image quickly and efficiently.

Overall, "SelectCropCompressImage" is a useful Flutter package that simplifies the process of selecting, cropping, and compressing images for use within the app, without requiring users to leave the app or use other third-party tools.

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

* **compressionAmount**: the amount of compression the image will go through before returning.
* **context**: the build context is needed to match the color of the theme inside the image cropper widget.

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

import 'package:selectcropcompressimage/selectcropcompressimage.dart';

Future getImageFromGallery() async {
  SelectCropCompressImage selectCropCompressImage = SelectCropCompressImage();
  Uint8List? selectedCroppedAndCompressImage =
      await selectCropCompressImage.selectCropCompressImageFromGallery(
    compressionAmount: 30,
    context: context,
  );
  if (selectedCroppedAndCompressImage != null) {
    //Do something with the image
  } else {
    //Discard...
  }
}

Future getImageFromCamera() async {
  SelectCropCompressImage selectCropCompressImage = SelectCropCompressImage();
  Uint8List? selectedCroppedAndCompressImage =
      await selectCropCompressImage.selectCropCompressImageFromCamera(
    compressionAmount: 30,
    context: context,
  );
  if (selectedCroppedAndCompressImage != null) {
    //Do something with the image
  } else {
    //Discard...
  }
}

````

### Note

* The result file is saved in `NSTemporaryDirectory` on iOS and application Cache directory on Android, so it can be lost later, you are responsible for storing it somewhere permanent (if needed).



# SelectCropCompressImage

## A package to select, crop and compress images all through one call.

A package to select, crop and compress images all through one call.A package to select, crop and compress images all through one call. Image selection is done via Image Picker package, Image Cropping is achieved through the Image Copper package and finally the compression is done using the Flutter Image Compress package.

## Features

- Image Selection
- Image Cropping
- Image Compression

## Getting started 

1. Import this package!
2. (FOR ANDROID ONLY) Add the following lines of code in your android manifest file. 
    <activity
        android:name="com.yalantis.ucrop.UCropActivity"
        android:screenOrientation="portrait"
        android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
    ** Above the 
            <!-- Don't delete the meta-data below.
                 This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
    line.
2. (FOR iOS, no further configurations needed!)
3. Create instance of the SelectCropCompressImage class and call the selectCropCompressImage function with the required parameters passed! And thats it!! :D

## Additional information

**Links to the packages used in this project.
Image Picker : https://pub.dev/packages/image_picker
Image Cropper : https://pub.dev/packages/image_cropper
Flutter Image Compress: https://pub.dev/packages/flutter_image_compress

**The CompressionAmount needs to be in a range of 0-100. Otherwise the default compression amount will be used, which is 0.

## Example

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

** View in file at implemented_example/example.dart



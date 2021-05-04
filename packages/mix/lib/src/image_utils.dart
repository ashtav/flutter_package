import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ImageUtils {
  /// ``` dart
  /// File file = await ImageUtils.urlToFile('imageUrl');
  /// ```
  static Future<File> urlToFile(String imageUrl) async {
    try {
      // get temporary directory of device.
      Directory tempDir = await getTemporaryDirectory();

      // get temporary path from temporary directory.
      String tempPath = tempDir.path;

      // create a new file in temporary path with random file name.
      File file = new File('$tempPath' + (DateTime.now().millisecondsSinceEpoch.toString()) + '.png');

      // call http.get method and pass imageUrl into it to get response.
      http.Response response = await http.get(imageUrl);

      // write bodyBytes received in response to file.
      await file.writeAsBytes(response.bodyBytes);

      // now return the file which is created with random name in
      // temporary directory and image bytes from response is written to // that file.
      return file;
    } catch (e) {
      return null;
    }
  }

  /// ``` dart
  /// String base64 = await ImageUtils.fileToBase64(file);
  /// ```
  static Future<String> fileToBase64(File file) async {
    try {
      String base64Image = base64Encode(file.readAsBytesSync());
      return base64Image;
    } catch (e) {
      return null;
    }
  }

  /// ``` dart
  /// File file = await ImageUtils.base64ToFile(base64);
  /// ```
  static Future<File> base64ToFile(String base64) async {
    try {
      Uint8List uint8list = base64Decode(base64);
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File("$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".png");
      return await file.writeAsBytes(uint8list);
    } catch (e) {
      return null;
    }
  }

  /// ``` dart
  /// Image image = await ImageUtils.base64ToImage(base64);
  /// ```
  static Future<Image> base64ToImage(String base64) async {
    try {
      Uint8List uint8list = base64Decode(base64);
      return Image.memory(uint8list);
    } catch (e) {
      return null;
    }
  }

  /// ``` dart
  /// Uint8List data = await ImageUtils.fileToUint8List(file);
  /// ```
  static Future<Uint8List> fileToUint8List(File file) async {
    try {
      return file.readAsBytesSync();
    } catch (e) {
      return null;
    }
  }

  // Convert image to file
  // static Future<File> imageToFile({String imageName, String ext}) async {
  //   var bytes = await rootBundle.load('assets/$imageName.$ext');
  //   String tempPath = (await getTemporaryDirectory()).path;
  //   File file = File('$tempPath/profile.png');
  //   await file.writeAsBytes(
  //       bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
  //   return file;
  // }

  /// `size: [width, height]`
  ///
  /// ``` dart
  /// File file = await ImageUtils.resize(file);
  /// ```
  static Future<File> resize(File file, {int quality: 90, List<int> size: const [500, 500]}) async {
    try {
      File compressedFile = await FlutterNativeImage.compressImage(file.path, quality: 90, targetWidth: size[0], targetHeight: size[1]);
      return compressedFile;
    } catch (e) {
      return null;
    }
  }

  /// Ambil informasi gambar (height, width, orientasi), fungsi ini akan mengembalikan object `{'height': int, 'width': int, 'orientation': ImageOrientation}`
  ///
  /// ``` dart
  /// Map data = await ImageUtils.imageProperties(file);
  /// ```
  static Future<Map> imageProperties(File file) async {
    try {
      ImageProperties properties = await FlutterNativeImage.getImageProperties(file.path);
      return {'width': properties.width, 'height': properties.height, 'orientation': properties.orientation};
    } catch (e) {
      return {'width': null, 'height': null, 'orientation': null};
    }
  }
}

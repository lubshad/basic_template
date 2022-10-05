import 'dart:io';

import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';

class ImagePickerService {
  Future<PlatformFile?> pickFile() async {
    try {
      final requestStatus = await Permission.storage.request();
      if (requestStatus.isGranted) {
        final result = (await FilePicker.platform.pickFiles(
          type: FileType.image,
        ));
        if (result == null) return null;
        return result.files.first;
      }
    } on PlatformException catch (e) {
      _logException('Unsupported operation$e');
    } catch (e) {
      _logException(e.toString());
    }
    return null;
  }

  Future<File?> pickImage() async {
    final imageFile = await pickFile();
    if (imageFile == null) return null;
    logger.info("Picked file ${imageFile.size}");
    final croppedImagePath = await cropImage(imageFile);
    return croppedImagePath;
  }

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  void _logException(String message) {
    logger.info(message);
    _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<File?> cropImage(imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      maxWidth: 300,
      maxHeight: 300,
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      ],
    );
    if (croppedFile == null) return null;
    File croppd = File(croppedFile.path);
    logger.info("cropped  ${croppd.lengthSync()}");
    return croppd;
  }
}

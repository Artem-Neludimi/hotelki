import 'dart:io';

import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';

abstract class FirebaseStorageService {
  Future<String> uploadReferencesImage({
    required File file,
    required String email,
  });
}

class FirebaseStorageServiceImpl with ServiceLoggy implements FirebaseStorageService {
  FirebaseStorageServiceImpl();

  @override
  Future<String> uploadReferencesImage({
    required File file,
    required String email,
  }) async {
    loggy.info('uploadUserImage: ${file.path}');
    final compressedFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      '${file.absolute.path}_compressed.jpg',
      quality: 40,
    );

    final storageRef = FirebaseStorage.instance.ref();
    final uploadTask = await storageRef
        .child("images/$email/${basename(compressedFile!.path)}.jpg")
        .putFile(File(compressedFile.path));
    return await uploadTask.ref.getDownloadURL();
  }
}

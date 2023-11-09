import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';

abstract class FirebaseStorageService {
  Future<String> uploadReferencesImage({
    required File file,
    required String email,
    void Function(double progress)? onProgress,
    void Function(String url)? onSuccess,
    void Function(String message)? onError,
  });
}

class FirebaseStorageServiceImpl with ServiceLoggy implements FirebaseStorageService {
  FirebaseStorageServiceImpl();

  @override
  Future<String> uploadReferencesImage({
    required File file,
    required String email,
    void Function(double progress)? onProgress,
    void Function(String url)? onSuccess,
    void Function(String message)? onError,
  }) async {
    loggy.info('uploadUserImage: ${file.path}');
    final compressedFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      '${file.absolute.path}_compressed.jpg',
      quality: 40,
    );

    final storageRef = FirebaseStorage.instance.ref();
    final uploadTask = storageRef.child("images/$email/ref.jpg").putFile(File(compressedFile!.path));
    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress = 100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          if (onProgress != null) {
            onProgress(progress);
          }
        case TaskState.paused:
          break;
        case TaskState.canceled:
          break;
        case TaskState.error:
          if (onError != null) {
            loggy.error('Ошибка загрузки изображения ${file.path}');
            onError('Ошибка загрузки изображения');
          }
        case TaskState.success:
          taskSnapshot.ref.getDownloadURL().then((url) {
            loggy.info('Загружено изображение: $url');
            if (onSuccess != null) {
              onSuccess(url);
            }
          });
      }
    });
    return await uploadTask.snapshot.ref.getDownloadURL();
  }
}

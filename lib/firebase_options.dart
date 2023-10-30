// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDXK3E-tXe-o5I-TNbVfDDQ2mm0g5kqUOI',
    appId: '1:533368436349:web:8f4aaca58967db8a3b6314',
    messagingSenderId: '533368436349',
    projectId: 'hotelki',
    authDomain: 'hotelki.firebaseapp.com',
    storageBucket: 'hotelki.appspot.com',
    measurementId: 'G-SKLJCTDZXH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwFGT-TgUgLiSqg_JNxB5RUOduOqAVIsc',
    appId: '1:533368436349:android:a42f8195373e54e43b6314',
    messagingSenderId: '533368436349',
    projectId: 'hotelki',
    storageBucket: 'hotelki.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCl7y2EFsc2hbEpF8oHUESbaoZ1GBjlrwU',
    appId: '1:533368436349:ios:2cfaff735be9d2a23b6314',
    messagingSenderId: '533368436349',
    projectId: 'hotelki',
    storageBucket: 'hotelki.appspot.com',
    iosBundleId: 'com.gradoid.scalableFlutterAppStarter',
  );
}
// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD7pblSyi_lTYNqXDTABBSesLLSY8qrD7s',
    appId: '1:765408638356:web:dc3a7ff120aa700e18cb81',
    messagingSenderId: '765408638356',
    projectId: 'campussathi',
    authDomain: 'campussathi.firebaseapp.com',
    databaseURL: 'https://campussathi-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'campussathi.appspot.com',
    measurementId: 'G-D43J59V59D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeokIHx3PFqxx33_8EaEf7ICaceFuBRhI',
    appId: '1:765408638356:android:5e4b08d2009e635e18cb81',
    messagingSenderId: '765408638356',
    projectId: 'campussathi',
    databaseURL: 'https://campussathi-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'campussathi.appspot.com',
  );
}

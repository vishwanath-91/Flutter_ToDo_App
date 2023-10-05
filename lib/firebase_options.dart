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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyCxLtjv4-oSq5ZfOSVPptuTzXVXxNVHz6U',
    appId: '1:182853959043:web:2bedcc8ebb21bf911d8ab6',
    messagingSenderId: '182853959043',
    projectId: 'todoapp-b2435',
    authDomain: 'todoapp-b2435.firebaseapp.com',
    storageBucket: 'todoapp-b2435.appspot.com',
    measurementId: 'G-B9QB42S402',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBH_GLzRcMqohaE57aGvBUOLHlez9kBUG4',
    appId: '1:182853959043:android:d97368e8a2a51b361d8ab6',
    messagingSenderId: '182853959043',
    projectId: 'todoapp-b2435',
    storageBucket: 'todoapp-b2435.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfaseNyQbf2NH_goa-vcN2TwtpZXlJCMI',
    appId: '1:182853959043:ios:e516668cdc9dcfd41d8ab6',
    messagingSenderId: '182853959043',
    projectId: 'todoapp-b2435',
    storageBucket: 'todoapp-b2435.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfaseNyQbf2NH_goa-vcN2TwtpZXlJCMI',
    appId: '1:182853959043:ios:5448a66b2c0bb1221d8ab6',
    messagingSenderId: '182853959043',
    projectId: 'todoapp-b2435',
    storageBucket: 'todoapp-b2435.appspot.com',
    iosBundleId: 'com.example.todoApp.RunnerTests',
  );
}
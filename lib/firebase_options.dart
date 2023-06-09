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
    apiKey: 'AIzaSyBnKuuFWK_eRSKyiALyecCRYkgbAiGB07U',
    appId: '1:835504164094:web:0bbf6395a835673c39a9af',
    messagingSenderId: '835504164094',
    projectId: 'agroapps-22bbb',
    authDomain: 'agroapps-22bbb.firebaseapp.com',
    storageBucket: 'agroapps-22bbb.appspot.com',
    measurementId: 'G-239RZ493Q0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_tZh75hbEAd52EozwY5BW99RM-BlZcOA',
    appId: '1:835504164094:android:445863b2a393748b39a9af',
    messagingSenderId: '835504164094',
    projectId: 'agroapps-22bbb',
    storageBucket: 'agroapps-22bbb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOmMlL1JNnpGa78VIMLcU-Q_h1Gu_yHhI',
    appId: '1:835504164094:ios:65e192ff29cff76e39a9af',
    messagingSenderId: '835504164094',
    projectId: 'agroapps-22bbb',
    storageBucket: 'agroapps-22bbb.appspot.com',
    iosClientId:
        '835504164094-nsc6pfq0mq0el9cu0d8vaam47msu26be.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileagroapps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOmMlL1JNnpGa78VIMLcU-Q_h1Gu_yHhI',
    appId: '1:835504164094:ios:65e192ff29cff76e39a9af',
    messagingSenderId: '835504164094',
    projectId: 'agroapps-22bbb',
    storageBucket: 'agroapps-22bbb.appspot.com',
    iosClientId:
        '835504164094-nsc6pfq0mq0el9cu0d8vaam47msu26be.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobileagroapps',
  );
}

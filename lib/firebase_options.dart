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
    apiKey: 'AIzaSyCDTmWYGH1-tl3gBT4zLXpAVM1UqLN17ic',
    appId: '1:215068443758:web:c3b0dfe0b32cd9472b927f',
    messagingSenderId: '215068443758',
    projectId: 'login-f04a1',
    authDomain: 'login-f04a1.firebaseapp.com',
    storageBucket: 'login-f04a1.appspot.com',
    measurementId: 'G-YEQ7KF7S61',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChjtLS-dD0exWItSvAzXAFxwEnKdqYBPI',
    appId: '1:215068443758:android:8d6403e70cccab5c2b927f',
    messagingSenderId: '215068443758',
    projectId: 'login-f04a1',
    storageBucket: 'login-f04a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFq1vTSegjBB8Nykc9q3XmS-VTRU5aGmk',
    appId: '1:215068443758:ios:b945a5d071b9ac822b927f',
    messagingSenderId: '215068443758',
    projectId: 'login-f04a1',
    storageBucket: 'login-f04a1.appspot.com',
    iosBundleId: 'com.example.flutterLogindef',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFq1vTSegjBB8Nykc9q3XmS-VTRU5aGmk',
    appId: '1:215068443758:ios:fa387c7c99632ebb2b927f',
    messagingSenderId: '215068443758',
    projectId: 'login-f04a1',
    storageBucket: 'login-f04a1.appspot.com',
    iosBundleId: 'com.example.flutterLogindef.RunnerTests',
  );
}

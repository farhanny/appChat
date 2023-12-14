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
    apiKey: 'AIzaSyC7m52s676XwYO3qd6CuF3aF2SWl33k_eU',
    appId: '1:150704605983:web:72d6dfdea3bb581688fe2a',
    messagingSenderId: '150704605983',
    projectId: 'appchat-ab04e',
    authDomain: 'appchat-ab04e.firebaseapp.com',
    storageBucket: 'appchat-ab04e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPzXVUkgrdyjSedIhLGTMuqBB54YxUFNc',
    appId: '1:150704605983:android:5d44b33c16add55e88fe2a',
    messagingSenderId: '150704605983',
    projectId: 'appchat-ab04e',
    storageBucket: 'appchat-ab04e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBK_bzTaiDbbUHzO1SqQyEBm_tjkNc3Lbg',
    appId: '1:150704605983:ios:a4f0598d4c0cd60d88fe2a',
    messagingSenderId: '150704605983',
    projectId: 'appchat-ab04e',
    storageBucket: 'appchat-ab04e.appspot.com',
    iosBundleId: 'com.example.flutterApplicationMessage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBK_bzTaiDbbUHzO1SqQyEBm_tjkNc3Lbg',
    appId: '1:150704605983:ios:b48f121939cc6d9388fe2a',
    messagingSenderId: '150704605983',
    projectId: 'appchat-ab04e',
    storageBucket: 'appchat-ab04e.appspot.com',
    iosBundleId: 'com.example.flutterApplicationMessage.RunnerTests',
  );
}
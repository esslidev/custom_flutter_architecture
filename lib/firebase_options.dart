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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2oU5zco-GKXe5bCSpDS1mPdG_msytouE',
    appId: '1:1011163149812:android:f04d6fcc0fa92b7e1235a1',
    messagingSenderId: '1011163149812',
    projectId: 'travinglo-6a445',
    storageBucket: 'travinglo-6a445.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeeeuuIZzyQ-M9Flwz8OnNKSVDzDDXNbA',
    appId: '1:1011163149812:ios:1d678e26786456d01235a1',
    messagingSenderId: '1011163149812',
    projectId: 'travinglo-6a445',
    storageBucket: 'travinglo-6a445.appspot.com',
    androidClientId:
        '1011163149812-32l17mgkibqf592ualbpqlr12efmuh0f.apps.googleusercontent.com',
    iosClientId:
        '1011163149812-tck1e36ljpqfhdma0vl5torc6cpse1mu.apps.googleusercontent.com',
    iosBundleId: 'com.esslidev.travinglo',
  );
}

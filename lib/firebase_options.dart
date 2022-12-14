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
    apiKey: 'AIzaSyD2_PpyBueXU9yvx6rZG9a6AAIuFfg7clI',
    appId: '1:990141808440:web:a0b1eb255b506d299fcbcd',
    messagingSenderId: '990141808440',
    projectId: 'flutter-ecommerce-app-777f7',
    authDomain: 'flutter-ecommerce-app-777f7.firebaseapp.com',
    storageBucket: 'flutter-ecommerce-app-777f7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpOv1Bs9KN-Uyon08aFzjSRZ2nNPyKLgc',
    appId: '1:990141808440:android:2ac0b0d144f673a49fcbcd',
    messagingSenderId: '990141808440',
    projectId: 'flutter-ecommerce-app-777f7',
    storageBucket: 'flutter-ecommerce-app-777f7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIC48GgNB7KJQJYJlks1fb50FeuA7xCvc',
    appId: '1:990141808440:ios:eddffbd7c828078f9fcbcd',
    messagingSenderId: '990141808440',
    projectId: 'flutter-ecommerce-app-777f7',
    storageBucket: 'flutter-ecommerce-app-777f7.appspot.com',
    iosClientId: '990141808440-5dl31s71in63dklu05ta41vr7rf68uss.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterEcommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIC48GgNB7KJQJYJlks1fb50FeuA7xCvc',
    appId: '1:990141808440:ios:eddffbd7c828078f9fcbcd',
    messagingSenderId: '990141808440',
    projectId: 'flutter-ecommerce-app-777f7',
    storageBucket: 'flutter-ecommerce-app-777f7.appspot.com',
    iosClientId: '990141808440-5dl31s71in63dklu05ta41vr7rf68uss.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterEcommerceApp',
  );
}

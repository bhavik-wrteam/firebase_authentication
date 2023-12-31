// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members

/*
Platform  Firebase App Id
web       1:980895298081:web:cdfa9bab04ab8df72ce960
android   1:980895298081:android:c2f2a5dc9a93d26f2ce960
ios       1:980895298081:ios:d1c9b8fb23945da12ce960
macos     1:980895298081:ios:6f679b3df6208afc2ce960

*/

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
    apiKey: 'AIzaSyCJucEY_WY37fslQ4rC7wpKcnWV4Aqfjtk',
    appId: '1:980895298081:web:cdfa9bab04ab8df72ce960',
    messagingSenderId: '980895298081',
    projectId: 'testing-01-7f664',
    authDomain: 'testing-01-7f664.firebaseapp.com',
    storageBucket: 'testing-01-7f664.appspot.com',
    measurementId: 'G-7BRN8JPTQX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUXuzIQtkbVeqyYT_6Enrn2vhX9PoyjNE',
    appId: '1:980895298081:android:c2f2a5dc9a93d26f2ce960',
    messagingSenderId: '980895298081',
    projectId: 'testing-01-7f664',
    storageBucket: 'testing-01-7f664.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDo2MR4Wwk3BCe3HdtqQF8u1qzDtw8Mrug',
    appId: '1:980895298081:ios:d1c9b8fb23945da12ce960',
    messagingSenderId: '980895298081',
    projectId: 'testing-01-7f664',
    storageBucket: 'testing-01-7f664.appspot.com',
    iosClientId:
        '980895298081-eg4adrakht4l64hjsahj9vnh5deshsop.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDo2MR4Wwk3BCe3HdtqQF8u1qzDtw8Mrug',
    appId: '1:980895298081:ios:6f679b3df6208afc2ce960',
    messagingSenderId: '980895298081',
    projectId: 'testing-01-7f664',
    storageBucket: 'testing-01-7f664.appspot.com',
    iosClientId:
        '980895298081-t9fdgrh074nejnmboh9hen85ejr7t6r3.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled1.RunnerTests',
  );
}

// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyAVwBwmahXX0cEUA1wNSkBE2t00NKhwolI',
    appId: '1:688381101056:web:180e8e9a99560bc3f1c4e5',
    messagingSenderId: '688381101056',
    projectId: 'domi-aqar',
    authDomain: 'domi-aqar.firebaseapp.com',
    storageBucket: 'domi-aqar.firebasestorage.app',
    measurementId: 'G-R9ZCGVQ6TH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdGub7rWCPSBvOSUq18tfdRYmItLWi-hI',
    appId: '1:688381101056:android:cf947da9d5424f07f1c4e5',
    messagingSenderId: '688381101056',
    projectId: 'domi-aqar',
    storageBucket: 'domi-aqar.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0EivT_trEzZweNSMS1S0xgBfMo707fr8',
    appId: '1:688381101056:ios:ebc0f930f2061d30f1c4e5',
    messagingSenderId: '688381101056',
    projectId: 'domi-aqar',
    storageBucket: 'domi-aqar.firebasestorage.app',
    iosBundleId: 'com.example.domiAqar',
  );
}

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
    apiKey: 'AIzaSyAPQYJ0UQvspFvqrT2XelNOuvlRtL3JQhQ',
    appId: '1:675390555424:web:7981f54f72e3df3ba9c345',
    messagingSenderId: '675390555424',
    projectId: 'fast-trivia-8e157',
    authDomain: 'fast-trivia-8e157.firebaseapp.com',
    storageBucket: 'fast-trivia-8e157.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcTISifsFXiMBTYkxB-3RsRu3iqgg0aC0',
    appId: '1:675390555424:android:72bbceb89d9dec9aa9c345',
    messagingSenderId: '675390555424',
    projectId: 'fast-trivia-8e157',
    storageBucket: 'fast-trivia-8e157.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWZGJUl9Avi_Kb8ZgDpa2ZFhqDRIGK4a8',
    appId: '1:675390555424:ios:4ec604fa60c548efa9c345',
    messagingSenderId: '675390555424',
    projectId: 'fast-trivia-8e157',
    storageBucket: 'fast-trivia-8e157.appspot.com',
    iosClientId: '675390555424-kuq90m1auqss8uqci5vl195d2osgs2so.apps.googleusercontent.com',
    iosBundleId: 'com.example.fastTrivia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCWZGJUl9Avi_Kb8ZgDpa2ZFhqDRIGK4a8',
    appId: '1:675390555424:ios:319197fee705b803a9c345',
    messagingSenderId: '675390555424',
    projectId: 'fast-trivia-8e157',
    storageBucket: 'fast-trivia-8e157.appspot.com',
    iosClientId: '675390555424-p9bp7o8dtin9sr7c7gcstg4q7nlqkv3k.apps.googleusercontent.com',
    iosBundleId: 'com.example.fastTrivia.RunnerTests',
  );
}

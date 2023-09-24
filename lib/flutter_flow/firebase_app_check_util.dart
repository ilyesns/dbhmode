import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6LdTx6MmAAAAAMN6aTtkiK_rKSPUttUX3rjt4siF',
      androidProvider: AndroidProvider.playIntegrity,
    );

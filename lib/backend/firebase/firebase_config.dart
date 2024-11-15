import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC0X3KKTZbwWKg9UFPzovvYrRhKlqbjAdk",
            authDomain: "bookmatch-dev.firebaseapp.com",
            projectId: "bookmatch-dev",
            storageBucket: "bookmatch-dev.firebasestorage.app",
            messagingSenderId: "657268050811",
            appId: "1:657268050811:web:dafef18fcb07ecb1014bde",
            measurementId: "G-CFGD26Y0H5"));
  } else {
    await Firebase.initializeApp();
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyANxlFIjQznqeR5ECuGX0XY4_1ID4EdrtQ",
            authDomain: "cadisa-f0rzvq.firebaseapp.com",
            projectId: "cadisa-f0rzvq",
            storageBucket: "cadisa-f0rzvq.firebasestorage.app",
            messagingSenderId: "762449145183",
            appId: "1:762449145183:web:eab28134ff53e324289aea"));
  } else {
    await Firebase.initializeApp();
  }
}

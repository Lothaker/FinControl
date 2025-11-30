import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBG4ywXZpIlceHyoZNCwg87kRAN5E3ZEoM",
            authDomain: "fincontrol-c2f77.firebaseapp.com",
            projectId: "fincontrol-c2f77",
            storageBucket: "fincontrol-c2f77.firebasestorage.app",
            messagingSenderId: "210724087366",
            appId: "1:210724087366:web:9f3117a7aacba60923cc47",
            measurementId: "G-F2QGL4D5E8"));
  } else {
    await Firebase.initializeApp();
  }
}

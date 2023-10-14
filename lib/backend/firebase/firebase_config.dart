import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyASL0mHwLZMkpOrZb_Yu1EzI_PCi4OwIjA",
            authDomain: "ez-munch-c43dc.firebaseapp.com",
            projectId: "ez-munch-c43dc",
            storageBucket: "ez-munch-c43dc.appspot.com",
            messagingSenderId: "591752991652",
            appId: "1:591752991652:web:4926c0ca436ee3eb836731",
            measurementId: "G-CR7073MCF2"));
  } else {
    await Firebase.initializeApp();
  }
}

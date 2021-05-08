import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_box/app.dart';
import 'login.dart';

// Sample code from https://github.com/pythonhubpy/YouTube/blob/Firebae-CRUD-Part-1/lib/main.dart#L19
// video https://www.youtube.com/watch?v=SmmCMDSj8ZU&list=PLtr8DfMFkiJu0lr1OKTDaoj44g-GGnFsn&index=10&t=291s


class FirebaseDemo extends StatefulWidget {
  @override
  _FirebaseDemoState createState() => _FirebaseDemoState();
}

class _FirebaseDemoState extends State<FirebaseDemo> {

  // ======== Added for Authentication  ========
  UserCredential userCredential;
  String userID;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser
        .authentication;
    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

// Main build method
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          print("data exists");
          userID = FirebaseAuth.instance.currentUser.uid;
          return mainScreen();
        }
        else {
          return loginScreen();
        }
      },
    );
  }
}

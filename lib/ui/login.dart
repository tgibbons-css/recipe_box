import 'package:flutter/material.dart';
import 'package:recipe_box/ui/googleSignInButton.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'authenticate.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // New private method which includes the background image:
    BoxDecoration _buildBackground() {
      return BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/annie-spratt-5XZ2SyTOyvQ-unsplash.jpg"),
          fit: BoxFit.cover,
        ),
      );
    }

    Text _buildText() {
      return Text(
        'Recipes',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 75.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      );
    }

    return Scaffold(
      // We do not use backgroundColor property anymore.
      // New Container widget wraps our Center widget:
      body: Container(
        decoration: _buildBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildText(),
              SizedBox(height: 50.0),
              GoogleSignInButton(
                onPressed: () async {
                  //setState(() async {
                  // do authenication
                  userCredential = await signInWithGoogle();
                  userID = userCredential.user.uid;
                  print("Button onPressed DONE");
                  // });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }




}
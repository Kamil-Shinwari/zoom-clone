import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone_app/utils/Utils.dart';

 class  AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<User?> get authchanges => _auth.authStateChanges();
 Future<bool> SignInWithGoogle(BuildContext context) async {
  bool res=false;
    try {
      final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleauth =
          await googleuser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleauth!.accessToken,
        idToken: googleauth.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
          User? user=userCredential.user;
          if(user!=null){
            if(userCredential.additionalUserInfo!.isNewUser){
            await _firestore.collection("users").doc(user.uid).set({
                "username":user.displayName,
                "uid":user.uid,
                "profilePhoto":user.photoURL
              });
            }
            res=true;
          }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      res=false;
    }
    return res;
  }
}

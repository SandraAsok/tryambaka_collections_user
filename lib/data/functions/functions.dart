import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tryambaka_user/data/constants/constants.dart';
import 'package:tryambaka_user/main.dart';

Widget buildImageWithNumber(String imageUrl, {required bool isSelected}) {
  return Column(
    children: [
      // Image widget
      Container(
        width: 300,
        height: 280,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      kHeight10,
    ],
  );
}

Future<void> googleSignIn() async {
  final googleSignIn = GoogleSignIn();

  // ignore: body_might_complete_normally_catch_error
  final googleUser = await googleSignIn.signIn().catchError((onError) {});
  if (googleUser == null) return;

  final googleAuth = await googleUser.authentication;
  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

  await FirebaseAuth.instance.signInWithCredential(credential);
  navigatorKey.currentState!.popUntil((route) => route.isFirst);

  //there might be platform execption thrown when cancelling the flow ,it fixes itself when running in production
}

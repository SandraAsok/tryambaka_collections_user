import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/presentation/main_home.dart';
import 'package:tryambaka_user/presentation/screens/login/login_or_signup.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const SnackBar(content: Text("Something went wrong"));
          } else if (snapshot.hasData) {
            return const MainHome();
          } else {
            return const LoginOrSignUp();
          }
        },
      ),
    );
  }
}

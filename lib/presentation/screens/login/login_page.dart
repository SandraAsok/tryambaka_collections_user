import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/core/color/colors.dart';
import 'package:tryambaka_user/core/constants/constants.dart';
import 'package:tryambaka_user/core/functions/functions.dart';
import 'package:tryambaka_user/presentation/screens/login/sign_up_screen.dart';
import 'package:tryambaka_user/presentation/screens/login/widgets/forgot_password.dart';
import 'package:tryambaka_user/presentation/screens/login/widgets/login_background.dart';
import 'package:tryambaka_user/presentation/screens/login/widgets/textfield_signup.dart';
import 'package:tryambaka_user/presentation/widgets/utils.dart';

import '../../../main.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    String? passwordValidator(String? password) {
      if (password!.isEmpty) {
        return 'Password empty';
      } else if (password.length < 8) {
        return 'password must be 8 digits';
      }
      return null;
    }

    String? emailaddressValidator(String? email) {
      if (!EmailValidator.validate(emailController.text.trim())) {
        return 'invalid email';
      }

      return null;
    }

    Future<void> signIn() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
      } on FirebaseAuthException catch (e) {
        // ignore: avoid_print
        print(e);

        utils.showSnackbar(e.message);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);

      return;
    }

    return SafeArea(
      child: Stack(
        children: [
          const LoginBackground(imageurl: "assets/images/login_bg.jpg"),
          Scaffold(
            backgroundColor: transparent,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    const Center(
                      child: Text(
                        'Login to Account',
                        style: TextStyle(
                            fontSize: 30,
                            color: white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    kHeight10,
                    kHeight10,
                    kHeight10,
                    TextFieldSignUp(
                      // passwordVisible: false,
                      validator: emailaddressValidator,
                      formKey: formKey,
                      selection: 1,
                      controller: emailController,
                      icon: Icons.email, title: 'Email',
                    ),
                    kHeight10,
                    TextFieldSignUp(
                      passwordVisible: true,
                      // isNumberPad: true,
                      validator: passwordValidator,
                      // formKey: formKey,
                      controller: passwordController,
                      icon: Icons.lock,
                      title: 'Password',
                    ),
                    kHeight10,
                    kHeight10,
                    InkWell(
                      onTap: () {
                        signIn();
                      },
                      child: Container(
                        width: size.width * 0.9,
                        height: size.width * 0.13,
                        decoration: BoxDecoration(
                            border: Border.all(color: white),
                            borderRadius: BorderRadius.circular(20),
                            color: black),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    kHeight10,
                    Center(
                      child: SizedBox(
                        width: size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: size.width * 0.25,
                                height: 1,
                                color: white,
                              ),
                              const Text(
                                'or Continue with',
                                style: TextStyle(color: white, fontSize: 18),
                              ),
                              Container(
                                width: size.width * 0.25,
                                height: 1,
                                color: white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    kHeight10,
                    InkWell(
                      onTap: () {
                        googleSignIn();
                      },
                      child: SizedBox(
                        width: 40,
                        child: Image.network(
                            'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-icon-png-transparent-background-osteopathy-16.png'),
                      ),
                    ),
                    kHeight10,
                    kHeight10,
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPassword(),
                              ));
                        },
                        child: const Text(
                          'Forgot Password?',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        )),
                    kHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: black.withOpacity(0.5)),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ));
                          },
                          child: const Text(
                            "Sign In",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/data/color/colors.dart';
import 'package:tryambaka_user/data/constants/constants.dart';
import 'package:tryambaka_user/main.dart';
import 'package:tryambaka_user/presentation/screens/login/widgets/login_background.dart';
import 'package:tryambaka_user/presentation/screens/login/widgets/textfield_signup.dart';
import 'package:tryambaka_user/presentation/widgets/utils.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final Size size = MediaQuery.of(context).size;
    String? emailaddressValidator(String? email) {
      if (!EmailValidator.validate(emailController.text.trim())) {
        return 'invalid email';
      }

      return null;
    }

    Future<void> verifyEmail() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
        utils.showSnackbar(e.message);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return SafeArea(
      child: Stack(
        children: [
          LoginBackground(imageurl: "assets/images/login_bg.jpg"),
          Scaffold(
            backgroundColor: transparent,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 250,
                      ),
                      const Center(
                        child: Text(
                          'Recive an Email to reset your password',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      kHeight10,
                      kHeight10,
                      const SizedBox(
                        height: 100,
                      ),
                      TextFieldSignUp(
                          validator: emailaddressValidator,
                          formKey: formKey,
                          selection: 1,
                          controller: emailController,
                          icon: Icons.email,
                          title: 'Email'),
                      kHeight10,
                      kHeight10,
                      kHeight10,
                      InkWell(
                        onTap: () {
                          verifyEmail();
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
                                'Reset Password',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      kHeight10,
                      kHeight10,
                      kHeight10,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

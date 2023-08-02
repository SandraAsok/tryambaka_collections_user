// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackbar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

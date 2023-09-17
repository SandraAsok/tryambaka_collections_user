import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/domain/cartmodel.dart';

Future<void> addToCart(Cart cartmodel, BuildContext context) async {
  final cartProduct = FirebaseFirestore.instance.collection('cart');
  final reference = cartProduct.doc();
  try {
    SnackBar(
      content: const Text("Product added to cart"),
      action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }),
    );
    await reference.set({
      'id': reference.id,
      'userId': cartmodel.userId,
      'productName': cartmodel.productName,
      'subName': cartmodel.subName,
      'price': cartmodel.price,
      'color': cartmodel.color,
      'description': cartmodel.description,
      'image': cartmodel.imageList,
    }).then((value) {
      Navigator.of(context).pop();
    });
  } catch (e) {
    SnackBar(
      content: Text('Failed to add product : $e'),
      action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }),
    );
    log("Failed to add product : $e");
  }
}

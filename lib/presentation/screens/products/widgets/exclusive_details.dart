import 'dart:developer';
import 'package:flutter/material.dart';

class ExclusiveDetails extends StatefulWidget {
  final String id;
  final String productName;
  final String subName;
  final String category;
  final String description;
  final String quantity;
  final String color;
  final String price;
  final List<dynamic> image;
  const ExclusiveDetails({
    super.key,
    required this.id,
    required this.productName,
    required this.subName,
    required this.category,
    required this.description,
    required this.quantity,
    required this.color,
    required this.price,
    required this.image,
  });

  @override
  State<ExclusiveDetails> createState() => _ExclusiveDetailsState();
}

class _ExclusiveDetailsState extends State<ExclusiveDetails> {
  List imageList = [];

  @override
  void initState() {
    imageList = widget.image;
    log(imageList.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

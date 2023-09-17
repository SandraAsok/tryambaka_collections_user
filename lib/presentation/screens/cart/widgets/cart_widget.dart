import 'package:flutter/cupertino.dart';

class CartWidget extends StatefulWidget {
  final String id;
  final String productName;
  final String subName;
  final String color;
  final int price;
  final String description;
  final List<dynamic> imageList;
  const CartWidget(
      {super.key,
      required this.id,
      required this.productName,
      required this.subName,
      required this.color,
      required this.price,
      required this.description,
      required this.imageList});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

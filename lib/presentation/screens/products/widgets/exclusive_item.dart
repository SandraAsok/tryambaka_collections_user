import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/core/color/colors.dart';
import 'package:tryambaka_user/core/constants/constants.dart';
import 'package:tryambaka_user/presentation/screens/detail/product_detail_screen.dart';

class ExclusiveItem extends StatelessWidget {
  final String id;
  final String productName;
  final String subName;
  final String category;
  final String description;
  final String quantity;
  final String color;
  final String price;
  final List<dynamic> image;

  const ExclusiveItem({
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => ProductDetailScreen(
                    id: id,
                    productName: productName,
                    subName: subName,
                    description: description,
                    quantity: quantity,
                    color: color,
                    price: price,
                    image: image,
                  )));
        },
        child: Column(
          children: [
            Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(image[0]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            kHeight10,
            SizedBox(
              height: 25,
              width: 180,
              child: Text(
                productName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 18,
                  color: blackfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            kHeight5,
            Text(
              "₹$price/-",
              style: const TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 18,
                  color: blackfont,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

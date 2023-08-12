import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/data/color/colors.dart';
import 'package:tryambaka_user/data/constants/constants.dart';
import 'package:tryambaka_user/presentation/screens/home/widgets/exclusive_details.dart';

class ExclusiveTile extends StatelessWidget {
  final String id;
  final String productName;
  final String subName;
  final String category;
  final String description;
  final String quantity;
  final String color;
  final String price;
  final List<dynamic> image;

  const ExclusiveTile({
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
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => ExclusiveDetails(
                    id: id,
                    productName: productName,
                    subName: subName,
                    category: category,
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
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(
                  image: NetworkImage(image[0]),
                  fit: BoxFit.contain,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 145,
                    top: 0,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: black,
                              size: 25,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            kHeight10,
            Text(
              productName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                letterSpacing: 0.5,
                fontSize: 20,
                color: blackfont,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 15,
                  color: blackfont,
                  fontWeight: FontWeight.bold),
            ),
            kHeight10,
          ],
        ),
      ),
    );
  }
}

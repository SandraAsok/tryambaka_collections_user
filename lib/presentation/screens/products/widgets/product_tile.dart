import 'package:flutter/material.dart';
import 'package:tryambaka_user/data/color/colors.dart';
import 'package:tryambaka_user/data/constants/constants.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double productHeight = (size.height - kToolbarHeight - 24) / 5;
    final double productWidth = size.width / 2;
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 7,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (productHeight / productWidth),
        crossAxisSpacing: 8,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/men.jpg"),
                      fit: BoxFit.cover,
                    )),
              ),
              kHeight10,
              const Text(
                "Traditional Set",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  letterSpacing: .5,
                  fontSize: 20,
                  color: fontcolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "1599/-",
                style: TextStyle(
                  letterSpacing: .5,
                  fontSize: 15,
                  color: fontcolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight10,
            ],
          ),
        );
      },
    );
  }
}

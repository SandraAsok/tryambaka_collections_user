import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/core/color/colors.dart';
import 'package:tryambaka_user/core/constants/constants.dart';
import 'package:tryambaka_user/presentation/screens/products/widgets/exclusive_item.dart';
import 'package:tryambaka_user/presentation/widgets/category_guesture_detector.dart';
import 'package:tryambaka_user/presentation/widgets/shimmer_effect.dart';

class CategoryMainScreen extends StatefulWidget {
  const CategoryMainScreen({super.key});

  @override
  State<CategoryMainScreen> createState() => _CategoryMainScreenState();
}

final Stream<QuerySnapshot> _exclusiveproductstream =
    FirebaseFirestore.instance.collection('exclusive').snapshots();

class _CategoryMainScreenState extends State<CategoryMainScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double productHeight = (size.height - kToolbarHeight - 24) / 7;
    final double productWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      "Explore Fashion world",
                      style: appbarTitle,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.heart_fill,
                        color: black,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.cart_fill,
                        color: black,
                        size: 30,
                      ),
                    ),
                    kWidth25,
                  ],
                ),
                kHeight10,
                Row(
                  children: [
                    CategoryGuestureDetector(
                      assetUrl: "assets/images/men.jpg",
                      category: 'Men',
                    ),
                    Spacer(),
                    CategoryGuestureDetector(
                      assetUrl: "assets/images/woman.jpeg",
                      category: 'Woman',
                    ),
                  ],
                ),
                kHeight10,
                Row(
                  children: [
                    CategoryGuestureDetector(
                      assetUrl: "assets/images/boy.webp",
                      category: 'Boy',
                    ),
                    Spacer(),
                    CategoryGuestureDetector(
                      assetUrl: "assets/images/girl.jpg",
                      category: 'Girl',
                    ),
                  ],
                ),
                kHeight25,
                Text(
                  "Wear the altered reality",
                  style: appbarTitle,
                ),
                kHeight10,
                StreamBuilder<QuerySnapshot>(
                  stream: _exclusiveproductstream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<DocumentSnapshot> documents =
                          snapshot.data!.docs;
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: documents.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (productHeight / productWidth),
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          return ExclusiveItem(
                            id: documents[index].get('id'),
                            productName: documents[index].get('productName'),
                            subName: documents[index].get('subName'),
                            category: documents[index].get('category'),
                            description: documents[index].get('description'),
                            quantity: documents[index].get('quantity'),
                            color: documents[index].get('color'),
                            price: documents[index].get('price'),
                            image: documents[index].get('image'),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error : ${snapshot.error}");
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const ShimmerEffect();
                    } else {
                      return const ShimmerEffect();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

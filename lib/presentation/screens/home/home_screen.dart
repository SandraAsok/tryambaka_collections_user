// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/core/color/colors.dart';
import 'package:tryambaka_user/presentation/screens/cart/cart_screen.dart';
import 'package:tryambaka_user/presentation/screens/category/widgets/category_home.dart';
import 'package:tryambaka_user/presentation/screens/products/widgets/exclusive_item.dart';
import 'package:tryambaka_user/presentation/screens/products/exclusive_screen.dart';
import 'package:tryambaka_user/presentation/screens/products/widgets/product_tile.dart';
import 'package:tryambaka_user/presentation/screens/search/search_screen.dart';
import 'package:tryambaka_user/presentation/widgets/shimmer_effect.dart';

import '../../../core/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
  int _currentImageIndex = 1;
  final Stream<QuerySnapshot> _exclusiveproductstream =
      FirebaseFirestore.instance.collection('exclusive').snapshots();
  final Stream<QuerySnapshot> _productstream =
      FirebaseFirestore.instance.collection('products').snapshots();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      int newIndex = (_scrollController.offset / 300).round();
      if (newIndex != _currentImageIndex) {
        setState(() {
          _currentImageIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight10,
            Row(
              children: [
                const Spacer(),
                Text(
                  "Tryambaka",
                  style: appbarTitle,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const SearchScreen()));
                  },
                  icon: const Icon(
                    CupertinoIcons.search,
                    color: black,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const CartScreen()));
                  },
                  icon: const Icon(
                    CupertinoIcons.cart_fill,
                    color: black,
                    size: 30,
                  ),
                ),
                kWidth25,
              ],
            ),
            kHeight25,
            const Padding(
              padding: EdgeInsets.all(15.0),
            ),
            kHeight10,
            Row(
              children: [
                Text(
                  "\t\t Tryambaka Designs",
                  style: appbarTitle,
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => const ExclusiveScreen()));
                    },
                    child: Text(
                      "show more...>",
                      style: subTitle,
                    )),
              ],
            ),
            kHeight10,
            SingleChildScrollView(
              child: SizedBox(
                height: 400,
                child: StreamBuilder<QuerySnapshot>(
                    stream: _exclusiveproductstream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
                        return ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
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
                    }),
              ),
            ),
            Text(
              "\t\tCategories",
              style: appbarTitle,
            ),
            kHeight25,
            const Row(
              children: [
                Spacer(),
                CategoryMenCircle(url: 'assets/images/men.jpg'),
                Spacer(),
                CategoryWomanCircle(url: 'assets/images/woman.jpeg'),
                Spacer(),
                CategoryBoyCircle(url: 'assets/images/boy.webp'),
                Spacer(),
                CategoryGirlCircle(url: 'assets/images/girl.jpg'),
                Spacer(),
              ],
            ),
            kHeight25,
            Text(
              "\t\tJust For You",
              style: appbarTitle,
            ),
            kHeight25,
            StreamBuilder<QuerySnapshot>(
                stream: _productstream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<DocumentSnapshot> documents =
                        snapshot.data!.docs;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: documents.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (itemWidth / itemHeight),
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 20.0,
                      ),
                      itemBuilder: ((context, index) {
                        return ProductTile(
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
                      }),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error : ${snapshot.error}");
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const ShimmerEffect();
                  } else {
                    return const ShimmerEffect();
                  }
                }),
          ],
        ),
      ),
    );
  }
}

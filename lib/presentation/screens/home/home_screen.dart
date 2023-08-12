// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/data/color/colors.dart';
import 'package:tryambaka_user/presentation/screens/home/widgets/category_home.dart';
import 'package:tryambaka_user/presentation/screens/home/widgets/exclusive_tile.dart';
import 'package:tryambaka_user/presentation/screens/products/widgets/product_tile.dart';
import 'package:tryambaka_user/presentation/widgets/shimmer_effect.dart';

import '../../../data/constants/constants.dart';
import '../search/widgets/search_widget.dart';

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
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.heart,
                    color: black,
                    size: 30,
                  ),
                ),
                kWidth25,
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.cart,
                    color: black,
                    size: 30,
                  ),
                ),
                kWidth25,
              ],
            ),
            kHeight25,
            const CustomSearchWidget(),
            kHeight25,
            SingleChildScrollView(
              child: SizedBox(
                height: 290,
                child: StreamBuilder<QuerySnapshot>(
                    stream: _exclusiveproductstream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
                        return ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            return ExclusiveTile(
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
            kHeight10,
            kHeight10,
            Text(
              "\t\tCategories",
              style: appbarTitle,
            ),
            kHeight10,
            const Row(
              children: [
                Spacer(),
                Category_Home(
                    categoryUrl: "assets/images/men.jpg",
                    categoryText: "Men\nCollections"),
                Spacer(),
                Category_Home(
                    categoryUrl: "assets/images/woman.jpeg",
                    categoryText: "Woman\nCollections"),
                Spacer(),
                Category_Home(
                    categoryUrl: "assets/images/boy.webp",
                    categoryText: "Boy\nCollections"),
                Spacer(),
                Category_Home(
                    categoryUrl: "assets/images/girl.jpg",
                    categoryText: "Girl\nCollections"),
                Spacer(),
              ],
            ),
            kHeight25,
            Text(
              "\t\tJust For You",
              style: appbarTitle,
            ),
            kHeight25,
            const ProductTile(),
          ],
        ),
      ),
    );
  }
}

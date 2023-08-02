// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/data/color/colors.dart';
import 'package:tryambaka_user/data/functions/functions.dart';
import 'package:tryambaka_user/presentation/screens/home/widgets/category_home.dart';
import 'package:tryambaka_user/presentation/screens/products/widgets/product_tile.dart';

import '../../../data/constants/constants.dart';
import '../search/widgets/search_widget.dart';

final List<String> _adImages = [
  "assets/images/saree_cover.jpeg",
  "assets/images/saree_cover2.jpeg",
  "assets/images/saree_cover.jpeg",
  "assets/images/saree_cover2.jpeg",
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
  int _currentImageIndex = 1;

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
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _adImages.length,
                  itemBuilder: (context, index) {
                    return buildImageWithNumber(_adImages[index],
                        isSelected: index == _currentImageIndex);
                  },
                ),
              ),
            ),
            kHeight10,
            SizedBox(
              // Use a fixed height for DashIndicator
              height: 20,
              child: DashIndicator(_currentImageIndex),
            ),
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
            ProductTile(),
          ],
        ),
      ),
    );
  }
}

class DashIndicator extends StatelessWidget {
  final int selectedIndex;

  DashIndicator(this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < _adImages.length; i++)
          Container(
            height: 6,
            width: 24,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: i == selectedIndex ? black : grey,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
      ],
    );
  }
}

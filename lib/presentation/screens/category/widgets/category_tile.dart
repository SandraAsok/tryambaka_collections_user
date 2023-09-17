import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/data/color/colors.dart';
import 'package:tryambaka_user/data/constants/constants.dart';
import 'package:tryambaka_user/presentation/screens/products/widgets/product_tile.dart';
import 'package:tryambaka_user/presentation/screens/search/widgets/search_widget.dart';
import 'package:tryambaka_user/presentation/widgets/shimmer_effect.dart';

class CategoryTile extends StatefulWidget {
  const CategoryTile({super.key, required this.category});
  final String category;

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
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
    String category = widget.category;
    var size = MediaQuery.of(context).size;
    final double productHeight = (size.height - kToolbarHeight - 24) / 6;
    final double productWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight25,
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: CustomSearchWidget(),
              ),
              kHeight25,
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .where('category', isEqualTo: category)
                    .snapshots(),
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
    );
  }
}

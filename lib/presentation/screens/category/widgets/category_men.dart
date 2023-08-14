import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/data/color/colors.dart';
import 'package:tryambaka_user/data/constants/constants.dart';
import 'package:tryambaka_user/presentation/screens/products/widgets/product_tile.dart';
import 'package:tryambaka_user/presentation/widgets/shimmer_effect.dart';

class MenCategory extends StatefulWidget {
  const MenCategory({super.key});

  @override
  State<MenCategory> createState() => _MenCategoryState();
}

class _MenCategoryState extends State<MenCategory> {
  ScrollController _scrollController = ScrollController();
  int _currentImageIndex = 1;
  final Stream<QuerySnapshot> _menproductstream = FirebaseFirestore.instance
      .collection('products')
      .where('category', isEqualTo: 'Men')
      //.where('type',isEqualTo: 'shirt')
      .snapshots();

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
    final double productHeight = (size.height - kToolbarHeight - 24) / 5;
    final double productWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: bgcolor,
          title: Text(
            "Men Collections",
            style: appbarTitle,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight10,
              StreamBuilder<QuerySnapshot>(
                stream: _menproductstream,
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

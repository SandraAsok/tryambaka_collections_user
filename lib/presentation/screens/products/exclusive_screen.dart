import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/data/color/colors.dart';
import 'package:tryambaka_user/data/constants/constants.dart';
import 'package:tryambaka_user/presentation/screens/products/widgets/exclusive_item.dart';
import 'package:tryambaka_user/presentation/widgets/shimmer_effect.dart';

class ExclusiveScreen extends StatefulWidget {
  const ExclusiveScreen({super.key});

  @override
  State<ExclusiveScreen> createState() => _ExclusiveScreenState();
}

class _ExclusiveScreenState extends State<ExclusiveScreen> {
  final ScrollController _scrollController = ScrollController();
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
    var size = MediaQuery.of(context).size;
    final double productHeight = (size.height - kToolbarHeight - 24) / 6.5;
    final double productWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight10,
              Row(
                children: [
                  Text(
                    "Tryambaka Designs",
                    style: appbarTitle,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 25,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 25,
                      )),
                ],
              ),
              kHeight25,
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
    );
  }
}

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/core/constants/constants.dart';
import 'package:tryambaka_user/presentation/screens/products/widgets/product_tile.dart';
import 'package:tryambaka_user/presentation/screens/search/widgets/search_widget.dart';
import 'package:tryambaka_user/presentation/widgets/shimmer_effect.dart';

List<dynamic> availableProducts = [];
List<dynamic> filteredProducts = [];

class ExclusiveSearchScreen extends StatefulWidget {
  const ExclusiveSearchScreen({super.key});

  @override
  State<ExclusiveSearchScreen> createState() => _ExclusiveSearchScreenState();
}

class _ExclusiveSearchScreenState extends State<ExclusiveSearchScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 12, right: 12),
        child: Column(
          children: [
            kHeight10,
            CustomSearchWidget(
              onChanged: filterUsers,
            ),
            kHeight10,
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('exclusive')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    log('Data Received');
                    availableProducts = snapshot.data!.docs;
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: filteredProducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0),
                      itemBuilder: (context, index) {
                        final DocumentSnapshot productSnap =
                            filteredProducts[index];
                        return ProductTile(
                          id: productSnap['id'],
                          productName: productSnap['productName'],
                          subName: productSnap['subName'],
                          category: productSnap['category'],
                          description: productSnap['description'],
                          quantity: productSnap['quantity'],
                          color: productSnap['color'],
                          price: productSnap['price'],
                          image: productSnap['image'],
                        );
                      },
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const ShimmerEffect();
                  }
                  return const ShimmerEffect();
                },
              ),
            )
          ],
        ),
      ),
    ));
  }

  void filterUsers(String query) {
    setState(() {
      filteredProducts = availableProducts.where((doc) {
        String name = doc.data()['productName'].toLowerCase();
        String searchLower = query.toLowerCase();
        return name.contains(searchLower);
      }).toList();
    });
  }
}

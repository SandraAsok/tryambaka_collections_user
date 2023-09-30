// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/core/color/colors.dart';
import 'package:tryambaka_user/core/constants/constants.dart';
import 'package:tryambaka_user/presentation/screens/category/widgets/category_home.dart';
import 'package:tryambaka_user/presentation/screens/products/widgets/product_tile.dart';
import 'package:tryambaka_user/presentation/widgets/shimmer_effect.dart';

class CategoryMenTile extends StatefulWidget {
  const CategoryMenTile({super.key, required this.category});
  final String category;

  @override
  State<CategoryMenTile> createState() => _CategoryMenTileState();
}

class _CategoryMenTileState extends State<CategoryMenTile> {
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
    final double productHeight = (size.height - kToolbarHeight - 24) / 7;
    final double productWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight25,
                const Text(
                  "Explore the Men's world",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 25),
                ),
                kHeight25,
                const MenRow(),
                kHeight25,
                const Text(
                  "Choose your style",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 25),
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
      ),
    );
  }
}

class CategoryWomanTile extends StatefulWidget {
  const CategoryWomanTile({super.key, required this.category});
  final String category;

  @override
  State<CategoryWomanTile> createState() => _CategoryWomanTileState();
}

class _CategoryWomanTileState extends State<CategoryWomanTile> {
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
    final double productHeight = (size.height - kToolbarHeight - 24) / 7;
    final double productWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight25,
                const Text(
                  "Explore the Ladies world",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 25),
                ),
                kHeight25,
                const WomanRow(),
                kHeight25,
                const Text(
                  "Choose Your style",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 25),
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
      ),
    );
  }
}

class CategoryBoyTile extends StatefulWidget {
  const CategoryBoyTile({super.key, required this.category});
  final String category;

  @override
  State<CategoryBoyTile> createState() => _CategoryBoyTileState();
}

class _CategoryBoyTileState extends State<CategoryBoyTile> {
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
    final double productHeight = (size.height - kToolbarHeight - 24) / 7;
    final double productWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight25,
                const Text(
                  "Explore the world for your prince",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 25),
                ),
                kHeight25,
                const BoyRow(),
                kHeight25,
                const Text(
                  "Choose Your style",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 25),
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
      ),
    );
  }
}

class CategoryGirlTile extends StatefulWidget {
  const CategoryGirlTile({super.key, required this.category});
  final String category;

  @override
  State<CategoryGirlTile> createState() => _CategoryGirlTileState();
}

class _CategoryGirlTileState extends State<CategoryGirlTile> {
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
    final double productHeight = (size.height - kToolbarHeight - 24) / 7;
    final double productWidth = size.width / 2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight25,
                const Text(
                  "Explore the world for your princess",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 25),
                ),
                kHeight25,
                const GirlRow(),
                kHeight25,
                const Text(
                  "Choose Your style",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.bold, fontSize: 25),
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
      ),
    );
  }
}

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tryambaka_user/core/color/colors.dart';
import 'package:tryambaka_user/core/constants/constants.dart';
import 'package:tryambaka_user/core/functions/firebase_functions.dart';
import 'package:tryambaka_user/domain/cartmodel.dart';
import 'package:tryambaka_user/presentation/screens/place_order/place_order.dart';

class ProductDetailScreen extends StatefulWidget {
  final String id;
  final String productName;
  final String subName;
  final String description;
  final String quantity;
  final String color;
  final String price;
  final List<dynamic> image;
  const ProductDetailScreen({
    super.key,
    required this.id,
    required this.productName,
    required this.subName,
    required this.description,
    required this.quantity,
    required this.color,
    required this.price,
    required this.image,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

String? _selectedsize;
final List<String> _sizes = ['S', 'M', 'L', 'XL', 'XXL'];

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List imageList = [];

  late SharedPreferences _preferences;
  bool isAddedToCart = false;

  @override
  void initState() {
    imageList = widget.image;
    log(imageList.toString());
    super.initState();
    _loadAddedToCartState();
  }

  Future<void> _loadAddedToCartState() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {
      isAddedToCart = _preferences.getBool(widget.id) ?? false;
    });
  }

  Future<void> _saveCartState() async {
    setState(() {
      isAddedToCart = true;
    });

    _preferences.setBool(widget.id, true);

    addToCart(
      Cart(
        productName: widget.productName,
        subName: widget.subName,
        price: int.parse(widget.price),
        color: widget.color,
        description: widget.description,
        id: widget.id,
        userId: FirebaseAuth.instance.currentUser!.email!,
        imageList: imageList,
      ),
      context,
    );
  }

  Future<void> _removeFromCart() async {
    setState(() {
      isAddedToCart = false;
    });

    _preferences.setBool(widget.id, false);
    removeCart(widget.id, context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: bgcolor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Center(
                        child: imageList.length == 1
                            ? GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  width: size.width * 0.7,
                                  child: Image.network(imageList[0]),
                                ),
                              )
                            : Stack(
                                children: [
                                  FlutterCarousel(
                                    items: List.generate(
                                        imageList.length,
                                        (index) => SizedBox(
                                            width: size.width * 0.7,
                                            child: Image.network(
                                                imageList[index]))),
                                    options: CarouselOptions(
                                      indicatorMargin: 5,
                                      viewportFraction: 1,
                                      slideIndicator:
                                          const CircularSlideIndicator(
                                        indicatorRadius: 4,
                                        itemSpacing: 15,
                                        currentIndicatorColor: black,
                                        indicatorBackgroundColor: grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      Material(
                        elevation: 50,
                        child: Container(
                          height: size.height / 1,
                          width: size.width / 1,
                          decoration: const BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 20, right: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.productName,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          letterSpacing: 0.5,
                                          fontSize: 22,
                                          color: black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    kHeight10,
                                    Text(
                                      widget.subName,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 18,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                kHeight10,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Price : ',
                                      style: TextStyle(
                                          letterSpacing: 0.5,
                                          fontSize: 15,
                                          color: grey,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      width: 72,
                                      child: Text(
                                        "₹${widget.price}.00",
                                        style: const TextStyle(
                                          letterSpacing: 0.5,
                                          fontSize: 18,
                                          color: black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                kHeight10,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Size',
                                          style: TextStyle(
                                              letterSpacing: 0.5,
                                              fontSize: 18,
                                              color: black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        kHeight10,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Wrap(
                                              spacing: 4.0,
                                              children: _sizes
                                                  .map((language) => ChoiceChip(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(18),
                                                        label: Text(
                                                          language,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18,
                                                                  color: grey),
                                                        ),
                                                        backgroundColor: white,
                                                        disabledColor: white,
                                                        selectedColor: black,
                                                        shape:
                                                            const CircleBorder(
                                                          side: BorderSide(
                                                              width: 1,
                                                              color: grey,
                                                              style: BorderStyle
                                                                  .solid),
                                                        ),
                                                        selected:
                                                            _selectedsize ==
                                                                language,
                                                        onSelected: (selected) {
                                                          if (selected) {
                                                            _selectSize(
                                                                language);
                                                          }
                                                        },
                                                      ))
                                                  .toList(),
                                            )
                                          ],
                                        ),
                                        kHeight10,
                                        kHeight10,
                                        Row(
                                          children: [
                                            const Text(
                                              'Color : ',
                                              style: TextStyle(
                                                  letterSpacing: .5,
                                                  fontSize: 18,
                                                  color: black,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                                width: 280,
                                                child: Text(
                                                  widget.color,
                                                  maxLines: 3,
                                                  style: const TextStyle(
                                                    letterSpacing: .5,
                                                    fontSize: 18,
                                                    color: black,
                                                  ),
                                                )),
                                          ],
                                        ),
                                        kHeight10,
                                        kHeight10,
                                        const Text(
                                          'Product Details',
                                          style: TextStyle(
                                              letterSpacing: .5,
                                              fontSize: 18,
                                              color: black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        kHeight10,
                                        SizedBox(
                                            width: 280,
                                            child: Text(
                                              widget.description,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 5,
                                              style: const TextStyle(
                                                letterSpacing: .5,
                                                fontSize: 18,
                                                color: black,
                                              ),
                                            )),
                                        kHeight10,
                                        kHeight10,
                                        const Text(
                                          'Delivery Details',
                                          style: TextStyle(
                                              letterSpacing: .5,
                                              fontSize: 18,
                                              color: black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        kHeight10,
                                        const Text(
                                          'Free Delivery \n Cash on Delivery Available \n Well packing \n Speed Delivery',
                                          style: TextStyle(
                                            letterSpacing: .5,
                                            fontSize: 18,
                                            color: black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width / 8, vertical: 15),
                      backgroundColor: black,
                      foregroundColor: white,
                    ),
                    onPressed: isAddedToCart ? _removeFromCart : _saveCartState,
                    child: Row(
                      children: [
                        const Icon(CupertinoIcons.cart),
                        kwidth10,
                        Text(
                          isAddedToCart ? 'Delete item' : 'Add to cart',
                          style: const TextStyle(
                            letterSpacing: .5,
                            fontSize: 14,
                            color: white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => PlaceOrderScreen(
                              totalPrice: int.parse(widget.price),
                              totalCount: 1.toString()),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width / 8, vertical: 15),
                        backgroundColor: black,
                        foregroundColor: white,
                      ),
                      child: const Row(
                        children: [
                          Icon(CupertinoIcons.bag),
                          kwidth10,
                          Text(
                            'Buy Now',
                            style: TextStyle(
                              letterSpacing: .5,
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _selectSize(String size) {
    setState(() {
      _selectedsize = size;
      log(_selectedsize.toString());
    });
  }
}

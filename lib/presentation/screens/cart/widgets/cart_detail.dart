import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:tryambaka_user/core/color/colors.dart';
import 'package:tryambaka_user/core/constants/constants.dart';

import '../../../../core/functions/firebase_functions.dart';

class CartDetails extends StatefulWidget {
  final String id;
  final String productName;
  final String subName;
  final String description;
  final String color;
  final int price;
  final List<dynamic> image;
  const CartDetails({
    super.key,
    required this.id,
    required this.productName,
    required this.subName,
    required this.description,
    required this.color,
    required this.price,
    required this.image,
  });

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

String? _selectedsize;
final List<String> _sizes = ['S', 'M', 'L', 'XL', 'XXL'];

class _CartDetailsState extends State<CartDetails> {
  List imageList = [];

  @override
  void initState() {
    imageList = widget.image;
    log(imageList.toString());
    super.initState();
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
                            horizontal: size.width / 10, vertical: 15),
                        backgroundColor: black,
                        foregroundColor: white,
                      ),
                      onPressed: () {
                        removeCart(widget.id, context);
                        Navigator.of(context).pop();
                      },
                      child: const Row(
                        children: [
                          Icon(CupertinoIcons.delete),
                          kwidth10,
                          Text(
                            'Remove Item',
                            style: TextStyle(
                              letterSpacing: .5,
                              fontSize: 14,
                              color: white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width / 10, vertical: 15),
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

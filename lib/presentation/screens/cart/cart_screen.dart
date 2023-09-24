import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/core/color/colors.dart';
import 'package:tryambaka_user/core/constants/constants.dart';
import 'package:tryambaka_user/presentation/screens/cart/widgets/cart_detail.dart';
import 'package:tryambaka_user/presentation/widgets/shimmer_effect.dart';

ValueNotifier<num> totalPriceNotifier = ValueNotifier(0);

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String email = FirebaseAuth.instance.currentUser!.email!;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              kHeight25,
              Row(
                children: [
                  const Spacer(),
                  Text(
                    'My Cart',
                    style: appbarTitle,
                  ),
                  const Spacer(),
                ],
              ),
              kHeight25,
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('cart')
                    .where('userId', isEqualTo: email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<DocumentSnapshot> documents =
                        snapshot.data!.docs;
                    return documents.isNotEmpty
                        ? ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              List productPic = documents[index].get('image');
                              return ListTile(
                                leading: ClipRRect(
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(productPic[0]),
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  documents[index]
                                      .get('productName')
                                      .toString(),
                                  style: const TextStyle(
                                      color: black, fontSize: 25),
                                ),
                                subtitle: Text(
                                  documents[index].get('subName').toString(),
                                  style: const TextStyle(
                                      color: black, fontSize: 18),
                                ),
                                // trailing: IconButton(
                                //     onPressed: () {

                                //     },
                                //     icon: const Icon(
                                //       Icons.delete,
                                //       color: black,
                                //     )),
                                onTap: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => CartDetails(
                                      id: documents[index].get('id'),
                                      productName:
                                          documents[index].get('productName'),
                                      subName: documents[index].get('subName'),
                                      description:
                                          documents[index].get('description'),
                                      color: documents[index].get('color'),
                                      price: documents[index].get('price'),
                                      image: documents[index].get('image'),
                                    ),
                                  ));
                                },
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: documents.length,
                          )
                        : const Center(
                            child: Text("Cart is empty"),
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

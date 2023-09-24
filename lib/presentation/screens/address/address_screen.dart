import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/core/color/colors.dart';
import 'package:tryambaka_user/core/constants/constants.dart';
import 'package:tryambaka_user/presentation/screens/address/add_address.dart';
import 'package:tryambaka_user/presentation/screens/place_order/widgets/address_widget.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String email = FirebaseAuth.instance.currentUser!.email!;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 12.0, right: 10, top: 10, bottom: 10),
        child: Column(
          children: [
            kHeight25,
            Text(
              "Delivery Address",
              style: TextStyle(
                letterSpacing: 0.5,
                fontSize: 26,
                color: black,
                fontWeight: FontWeight.w700,
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('address')
                  .where('email', isEqualTo: email)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;

                  return documents.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            log(documents.length.toString());
                            return AddressWidget(
                              name: documents[index].get('name'),
                              address: documents[index].get('address'),
                              pincode: documents[index].get('pincode'),
                              state: documents[index].get('state'),
                              city: documents[index].get('city'),
                              phone: documents[index].get('phone'),
                              id: documents[index].get('id'),
                              email: documents[index].get('email'),
                            );
                          },
                        )
                      : Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddNewAddresScreen(
                                      fromCheckOut: false,
                                    ),
                                  ));
                            },
                            child: Container(
                              width: size.width * 0.9,
                              height: size.height * 0.300,
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                  bottom:
                                      BorderSide(color: Colors.black, width: 1),
                                  right: BorderSide(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                  left:
                                      BorderSide(color: Colors.black, width: 1),
                                ),
                              ),
                              child: const Center(
                                  child: Text(
                                "Click Here to Add New Address",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                            ),
                          ),
                        );
                } else if (snapshot.hasError) {
                  Text('Error: ${snapshot.error}');
                  log(snapshot.error.toString());
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNewAddresScreen(
                              fromCheckOut: true,
                            ),
                          ));
                    },
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.300,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          bottom: BorderSide(color: Colors.black, width: 1),
                          right: BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          left: BorderSide(color: Colors.white, width: 1), // Ad
                        ),
                      ),
                      child: const Center(
                          child: Text(
                        "Add Address",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}

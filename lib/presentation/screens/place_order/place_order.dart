import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:tryambaka_user/core/color/colors.dart';
import 'package:tryambaka_user/core/constants/constants.dart';
import 'package:tryambaka_user/core/strings/strings.dart';
import 'package:tryambaka_user/presentation/screens/address/add_address.dart';
import 'package:tryambaka_user/presentation/screens/place_order/order_loading_screen.dart';
import 'package:tryambaka_user/presentation/screens/place_order/widgets/address_widget.dart';
import 'package:tryambaka_user/presentation/screens/place_order/widgets/edit_address_button.dart';
import 'package:tryambaka_user/presentation/screens/place_order/widgets/failure_widget.dart';
import 'package:tryambaka_user/presentation/screens/place_order/widgets/price_text_widget.dart';

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen(
      {super.key, required this.totalPrice, required this.totalCount});

  final int totalPrice;
  final String totalCount;

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  int selectedPaymentIndex = 0;
  bool isAddress = false;
  var razorpay = Razorpay();

  @override
  void initState() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const OrderLoadingScreen(),
        ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log(response.message.toString());
    showFailure(context, "Failure", "Payment was unsuccessful");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log("External wallet selected");
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight50,
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "Delivery Address",
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 26,
                    color: black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('address')
                    .where('email', isEqualTo: email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<DocumentSnapshot> documents =
                        snapshot.data!.docs;
                    isAddress = documents.isNotEmpty;
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
                                email: documents[index].get('email'),
                                id: documents[index].get('id'),
                              );
                            },
                          )
                        : EditButton(
                            name:
                                'Click Here!  to Add Address Before Confirming Order',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => AddNewAddresScreen(),
                                  ));
                            });
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
                          top: BorderSide(width: 1, color: black),
                          bottom: BorderSide(width: 1, color: black),
                          right: BorderSide(width: 1, color: black),
                          left: BorderSide(width: 1, color: white),
                        )),
                        child: const Center(
                          child: Text("Add Address",
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ),
                      ),
                    ),
                  );
                },
              ),
              kHeight10,
              Material(
                elevation: 12,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                shadowColor: black,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.18,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 16, left: 16, top: 16),
                    child: Column(
                      children: [
                        const PriceTextWidget(
                          text: 'Price Details :',
                          size: 22,
                        ),
                        kHeight5,
                        Row(
                          children: [
                            PriceTextWidget(
                              text: 'MRP (${widget.totalCount} item)',
                            ),
                            const Spacer(),
                            Text(
                              '₹ ${widget.totalPrice}',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ),
                        kHeight5,
                        const Row(
                          children: [
                            PriceTextWidget(
                              text: 'Shipping',
                            ),
                            Spacer(),
                            Text(
                              'Free',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        kHeight5,
                        Row(
                          children: [
                            const PriceTextWidget(
                              text: 'You Pay',
                              size: 20,
                            ),
                            const Spacer(),
                            Text(
                              // '₹ ${int.parse(widget.totalPrice)} ',
                              '₹ ${widget.totalPrice} ',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              kHeight10,
              const PriceTextWidget(
                text: 'Select Payment Method :',
                size: 22,
              ),
              Column(
                children: List.generate(
                  2,
                  (index) => GestureDetector(
                    onTap: () => setState(() {
                      selectedPaymentIndex = index;
                    }),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: white,
                          borderRadius: BorderRadius.circular(
                              10.0), // set the border radius to 12.0
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: index != 0
                                    ? Image.asset(paymentIcons[index])
                                    : Image.asset(paymentIcons[index]),
                              ),
                            ),
                            title: Text(
                              paymentTitles[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Radio(
                              value: selectedPaymentIndex == index,
                              groupValue: true,
                              onChanged: (value) {
                                setState(() {
                                  selectedPaymentIndex = index;
                                });
                              },
                              activeColor: black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width / 20,
                        vertical: size.height / 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    backgroundColor: black,
                    foregroundColor: white,
                  ),
                  onPressed: () async {
                    if (isAddress == true) {
                      if (selectedPaymentIndex == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderLoadingScreen(),
                            ));
                      } else {
                        final user = FirebaseAuth.instance.currentUser;
                        Map<String, dynamic> options = {
                          'key': 'rzp_test_UHMMVsaCTOCuSf',
                          'amount': widget.totalPrice * 100,
                          'name': 'Tryambaka',
                          'timeout': 300,
                          'description': 'Item',
                          'prefill': {'contact': '', 'email': user!.email}
                        };
                        razorpay.open(options);
                      }
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Please add an Address',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: black,
                        textColor: white,
                      );
                    }
                  },
                  child: const Row(
                    children: [
                      Text(
                        'Confirm Order',
                        style: TextStyle(
                          letterSpacing: .5,
                          fontSize: 18,
                          color: white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.check_mark,
                        size: 25,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }
}

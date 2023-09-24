import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/core/constants/constants.dart';
import 'package:tryambaka_user/domain/addressmodel.dart';
import 'package:tryambaka_user/presentation/screens/address/update_address.dart';
import 'package:tryambaka_user/presentation/screens/place_order/widgets/address_field.dart';
import 'package:tryambaka_user/presentation/screens/place_order/widgets/edit_address_button.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    Key? key,
    required this.name,
    required this.address,
    required this.pincode,
    required this.state,
    required this.city,
    required this.phone,
    required this.email,
    required this.id,
  }) : super(key: key);
  final String name;
  final String address;
  final String pincode;
  final String state;
  final String city;
  final String phone;
  final String email;
  final String id;

  @override
  Widget build(BuildContext context) {
    var data = Address(
        id: id,
        name: name,
        pinCode: int.parse(pincode),
        permanentAddress: address,
        state: state,
        city: city,
        phone: int.parse(phone),
        email: email);
    var size = MediaQuery.of(context).size;
    return Material(
      elevation: 12,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      shadowColor: Colors.black,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.250,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddressField(id: 'Name', value: name),
              kHeight10,
              AddressField(id: 'Address', value: address),
              kHeight10,
              AddressField(id: 'Pincode', value: pincode),
              kHeight10,
              AddressField(id: 'City', value: city),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      kHeight10,
                      Padding(
                        padding: const EdgeInsets.only(right: 54.0),
                        child: AddressField(id: 'State', value: state),
                      ),
                      kHeight10,
                      AddressField(id: 'Phone', value: phone),
                    ],
                  ),
                  const Spacer(),
                  EditButton(
                      name: 'Edit',
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => EditAdressScreen(data: data),
                          ),
                        );
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

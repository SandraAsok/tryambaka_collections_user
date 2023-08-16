import 'package:flutter/material.dart';
import 'package:tryambaka_user/data/color/colors.dart';
import 'package:tryambaka_user/data/constants/constants.dart';
import 'package:tryambaka_user/presentation/screens/home/widgets/category_home.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: bgcolor,
          title: Center(child: Text("All Categories", style: appbarTitle)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\t\tMale attire",
                  style: itemHeading,
                ),
                kHeight10,
                Row(
                  children: [
                    const Spacer(),
                    shirt,
                    const Spacer(),
                    doubleMund,
                    const Spacer(),
                    jubba,
                    const Spacer(),
                    Tshirt,
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

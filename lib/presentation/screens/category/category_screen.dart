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
                kHeight25,
                Row(
                  children: [
                    const Spacer(),
                    shirt,
                    const Spacer(),
                    doubleMund,
                    const Spacer(),
                    kurti,
                    const Spacer(),
                    Tshirt,
                    const Spacer(),
                  ],
                ),
                kHeight50,
                Text(
                  "\t\tLadies attire",
                  style: itemHeading,
                ),
                kHeight25,
                Row(
                  children: [
                    const Spacer(),
                    saree,
                    const Spacer(),
                    setmundu,
                    const Spacer(),
                    halfsaree,
                    const Spacer(),
                    churidar,
                    const Spacer(),
                  ],
                ),
                kHeight50,
                Text(
                  "\t\tBoys attire",
                  style: itemHeading,
                ),
                kHeight25,
                Row(
                  children: [
                    const Spacer(),
                    kidSet,
                    const Spacer(),
                    kidshirt,
                    const Spacer(),
                    kidmunduset,
                    const Spacer(),
                    kidkurtiset,
                    const Spacer(),
                  ],
                ),
                kHeight50,
                Text(
                  "\t\tGirls attire",
                  style: itemHeading,
                ),
                kHeight25,
                Row(
                  children: [
                    const Spacer(),
                    kidspattupavada,
                    const Spacer(),
                    kidsfrock,
                    const Spacer(),
                    kidsmidiset,
                    const Spacer(),
                    kidschuridar,
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

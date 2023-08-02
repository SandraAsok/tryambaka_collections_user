import 'package:flutter/material.dart';
import 'package:tryambaka_user/data/constants/constants.dart';

class Category_Home extends StatelessWidget {
  const Category_Home({
    super.key,
    required this.categoryUrl,
    required this.categoryText,
  });

  final String categoryUrl;
  final String categoryText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(categoryUrl),
        ),
        kHeight5,
        Text(categoryText, style: const TextStyle(fontWeight: FontWeight.bold))
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CategoryGuestureDetector extends StatelessWidget {
  const CategoryGuestureDetector({
    super.key,
    required this.assetUrl,
  });

  final String assetUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage(assetUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

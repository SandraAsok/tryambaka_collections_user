import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/presentation/screens/category/widgets/category_tile.dart';

class CategoryMenGuestureDetector extends StatelessWidget {
  const CategoryMenGuestureDetector({
    super.key,
    required this.assetUrl,
    required this.category,
  });

  final String assetUrl;

  final String category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => CategoryMenTile(
                  category: category,
                ),
            fullscreenDialog: true));
      },
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

class CategoryWomanGuestureDetector extends StatelessWidget {
  const CategoryWomanGuestureDetector({
    super.key,
    required this.assetUrl,
    required this.category,
  });

  final String assetUrl;

  final String category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => CategoryWomanTile(
                  category: category,
                ),
            fullscreenDialog: true));
      },
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

class CategoryBoyGuestureDetector extends StatelessWidget {
  const CategoryBoyGuestureDetector({
    super.key,
    required this.assetUrl,
    required this.category,
  });

  final String assetUrl;

  final String category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => CategoryBoyTile(
                  category: category,
                ),
            fullscreenDialog: true));
      },
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

class CategoryGirlGuestureDetector extends StatelessWidget {
  const CategoryGirlGuestureDetector({
    super.key,
    required this.assetUrl,
    required this.category,
  });

  final String assetUrl;

  final String category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => CategoryGirlTile(
                  category: category,
                ),
            fullscreenDialog: true));
      },
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/presentation/screens/category/widgets/category_tile.dart';
import 'package:tryambaka_user/presentation/screens/category/widgets/specific_item_tile.dart';

// ignore: camel_case_types

class CategoryCircle extends StatelessWidget {
  const CategoryCircle({
    super.key,
    required this.category,
    required this.url,
  });

  final String category;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => CategoryTile(
                  category: category,
                ),
            fullscreenDialog: true));
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SpecificItemCircle extends StatelessWidget {
  const SpecificItemCircle({
    super.key,
    required this.item,
    required this.url,
    required this.category,
  });

  final String item;
  final String url;
  final String category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => SpecificItemTile(
                  item: item,
                  category: category,
                ),
            fullscreenDialog: true));
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class MenRow extends StatelessWidget {
  const MenRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        SpecificItemCircle(
          item: 'shirt',
          url: "assets/images/shirt.jpg",
          category: 'Men',
        ),
        Spacer(),
        SpecificItemCircle(
          item: 'Mund',
          url: "assets/images/mundu.jpg",
          category: 'Men',
        ),
        Spacer(),
        SpecificItemCircle(
          item: 'kurta',
          url: "assets/images/kurti.jpg",
          category: 'Men',
        ),
        Spacer(),
        SpecificItemCircle(
          item: 'Tshirt',
          url: 'assets/images/tshirt.jpg',
          category: 'Men',
        ),
        Spacer(),
      ],
    );
  }
}

class WomanRow extends StatelessWidget {
  const WomanRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        SpecificItemCircle(
          item: 'Saree',
          url: 'assets/images/saree.jpg',
          category: 'Woman',
        ),
        Spacer(),
        SpecificItemCircle(
          item: 'setmundu',
          url: "assets/images/setmundu.jpg",
          category: 'Woman',
        ),
        Spacer(),
        SpecificItemCircle(
          item: 'Dhavani',
          url: "assets/images/halfsaree.jpg",
          category: 'Woman',
        ),
        Spacer(),
        SpecificItemCircle(
          item: 'Churidar',
          url: "assets/images/churidar.jpg",
          category: 'Woman',
        ),
        Spacer(),
      ],
    );
  }
}

class BoyRow extends StatelessWidget {
  const BoyRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        SpecificItemCircle(
          item: 'kidset',
          url: 'assets/images/kidset.jpg',
          category: 'Boy',
        ),
        Spacer(),
        SpecificItemCircle(
          item: 'kidsmundu',
          url: "assets/images/kidsmundu.jpg",
          category: 'Boy',
        ),
        Spacer(),
        SpecificItemCircle(
          item: 'kidskurta',
          url: "assets/images/kidskurti.jpg",
          category: 'Boy',
        ),
        Spacer(),
        Spacer(),
      ],
    );
  }
}

class GirlRow extends StatelessWidget {
  const GirlRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        SpecificItemCircle(
          item: 'pattu paavada',
          url: 'assets/images/kidspattupaavada.jpg',
          category: 'Girl',
        ),
        Spacer(),
        SpecificItemCircle(
          item: 'midiset',
          url: "assets/images/kidsmidiset.webp",
          category: 'Girl',
        ),
        Spacer(),
        SpecificItemCircle(
          item: 'frock',
          url: "assets/images/kidsfrock.webp",
          category: 'Girl',
        ),
        Spacer(),
        Spacer(),
      ],
    );
  }
}

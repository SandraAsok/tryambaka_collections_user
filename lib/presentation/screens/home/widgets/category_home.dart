import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryambaka_user/presentation/screens/category/widgets/category_men.dart';

// ignore: camel_case_types

class CategoryMen extends StatelessWidget {
  const CategoryMen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => MenCategory(), fullscreenDialog: true));
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/men.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Text('Men\nCollections',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class CategoryWoman extends StatelessWidget {
  const CategoryWoman({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/woman.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Text('Woman\nCollections',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class CategoryKids extends StatelessWidget {
  const CategoryKids({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/boy.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Text('Boy\nCollections',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class CategoryOthers extends StatelessWidget {
  const CategoryOthers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/girl.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Text('Girl\nCollections',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

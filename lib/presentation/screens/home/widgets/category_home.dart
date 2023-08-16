import 'package:flutter/cupertino.dart';
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
                builder: (context) => const MenCategory(),
                fullscreenDialog: true));
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

class CategoryBoy extends StatelessWidget {
  const CategoryBoy({super.key});

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

class CategoryGirl extends StatelessWidget {
  const CategoryGirl({super.key});

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

GestureDetector shirt = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage(
            "https://m.media-amazon.com/images/I/61hJHoTGDFL._UY879_.jpg"),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

GestureDetector doubleMund = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage(
            "https://m.media-amazon.com/images/I/7140k66zO2L._UY879_.jpg"),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

GestureDetector jubba = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage(
            "https://m.media-amazon.com/images/I/717hS3wQp1L._UY879_.jpg"),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

// ignore: non_constant_identifier_names
GestureDetector Tshirt = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: NetworkImage(
            'https://m.media-amazon.com/images/I/71jpwXiEDpL._UX679_.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

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
        image: AssetImage("assets/images/shirt.jpg"),
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
        image: AssetImage("assets/images/mundu.jpg"),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

GestureDetector kurti = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage("assets/images/kurti.jpg"),
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
        image: AssetImage('assets/images/tshirt.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

GestureDetector saree = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage('assets/images/saree.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

GestureDetector halfsaree = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage("assets/images/halfsaree.jpg"),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

GestureDetector setmundu = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage("assets/images/setmundu.jpg"),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

GestureDetector churidar = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage("assets/images/churidar.jpg"),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

GestureDetector kidSet = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage('assets/images/kidset.webp'),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

GestureDetector kidshirt = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage("assets/images/kidshirt.webp"),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

GestureDetector kidmunduset = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage("assets/images/kidmunduset.webp"),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

GestureDetector kidkurtiset = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage("assets/images/kidkurtiset.webp"),
        fit: BoxFit.cover,
      ),
    ),
  ),
);

GestureDetector kidspattupavada = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage('assets/images/kidspattupaavada.webp'),
        fit: BoxFit.fill,
      ),
    ),
  ),
);

GestureDetector kidsfrock = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage("assets/images/kidsfrock.webp"),
        fit: BoxFit.fill,
      ),
    ),
  ),
);

GestureDetector kidsmidiset = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage("assets/images/kidsmidiset.webp"),
        fit: BoxFit.fill,
      ),
    ),
  ),
);

GestureDetector kidschuridar = GestureDetector(
  onTap: () {},
  child: Container(
    width: 90,
    height: 90,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage("assets/images/kidschuridar.jpg"),
        fit: BoxFit.fill,
      ),
    ),
  ),
);

class Cart {
  final String productName;
  final String subName;
  final int price;
  final String color;
  final String description;
  final String? id;
  final String? userId;
  final List? imageList;

  Cart({
    required this.productName,
    required this.subName,
    required this.price,
    required this.color,
    required this.description,
    required this.id,
    required this.userId,
    required this.imageList,
  });
}

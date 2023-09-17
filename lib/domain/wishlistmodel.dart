class Wishlist {
  final String? id;
  final String? productId;
  final String? price;
  final String? quantity;
  final String? color;
  final String? email;
  Wishlist.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          color: json['color']! as String,
          productId: json['productid']! as String,
          quantity: json['quantity']! as String,
          price: json['price']! as String,
          email: json['email']! as String,
        );
  Wishlist({
    this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    this.color = "Black",
    required this.email,
  });
}

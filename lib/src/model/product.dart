import 'package:house_of_tomorrow/src/model/lang.dart';
import 'package:house_of_tomorrow/src/model/product_color.dart';

class Product {
  final Lang name;
  final Lang brand;
  final Lang desc;
  final int price;
  final String priceUnit;
  final String rating;
  final List<ProductColor> productColorList;

  const Product({
    required this.name,
    required this.desc,
    required this.brand,
    required this.price,
    required this.priceUnit,
    required this.productColorList,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: Lang.fromJson(json['name'] ?? {}),
      desc: Lang.fromJson(json['desc'] ?? {}),
      brand: Lang.fromJson(json['brand'] ?? {}),
      price: json['price'] ?? 0,
      priceUnit: json['priceUnit'] ?? '￦',
      rating: json['rating'] ?? '0.0',
      productColorList: (json['colorList'] ?? []).map<ProductColor>((c) {
        return ProductColor.fromJson(c);
      }).toList(),
    );
  }
}

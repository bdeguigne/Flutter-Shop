import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 0)
class Item extends HiveObject{

  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

  @HiveField(2)
  double price;

  @HiveField(3)
  double newPrice;

  @HiveField(4)
  bool isPromo;

  @HiveField(5)
  String thumbnail;

  @HiveField(6)
  List<String> screenshots;

  @HiveField(7)
  String type;

  @HiveField(8)
  List<String> category;

  @HiveField(9)
  bool isFeatured;

  Item(this.name, this.description, this.price, this.newPrice, this.isPromo,
      this.thumbnail, this.screenshots, this.type, this.category, this.isFeatured);

  factory Item.fromJson(dynamic json) {
    return Item(json["name"] as String, json["description"] as String, json["price"] as double, json["newPrice"] as double, json["isPromo"] as bool, json["thumbnail"] as String, List.from(json["screenshots"]), json["type"] as String, List.from(json["Category"]), json["isFeatured"] as bool);
  }

  @override
  String toString() {
    return 'ITEM = ${this.name}\n';
  }
}
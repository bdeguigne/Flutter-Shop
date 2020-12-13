class Item {
  String name;
  String description;
  double price;
  double newPrice;
  bool isPromo;
  String thumbnail;
  List<String> screenshots;
  String type;
  List<String> category;
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
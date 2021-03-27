class ProductModel {
  String id;
  String image;
  String title;
  String description;
  String discountName;
  String oldPrice;
  String price;

  ProductModel({
    this.id,
    this.image,
    this.title,
    this.description,
    this.discountName,
    this.oldPrice,
    this.price,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    discountName = json['discount_name'];
    oldPrice = json['old_price'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.title;
    data['description'] = this.description;
    data['discount_name'] = this.discountName;
    data['old_price'] = this.price;
    data['price'] = this.price;

    return data;
  }
}

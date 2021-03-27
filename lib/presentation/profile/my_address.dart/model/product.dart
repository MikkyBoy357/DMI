class AddressModel {
  String id;
  String username;
  String address;
  String city;
  String state;
  String pincode;
  String price;

  AddressModel({
    this.id,
    this.username,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.price,
  });
  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['price'] = this.price;

    return data;
  }
}

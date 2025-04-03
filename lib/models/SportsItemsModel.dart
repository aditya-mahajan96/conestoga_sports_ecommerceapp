class SportsItemModel {
  String? productId;
  String? productDescription;
  String? productImage;
  String? productManufacturer;
  String? productName;
  String? productPrice;

  // Constructor
  SportsItemModel({
    required this.productId,
    required this.productDescription,
    required this.productImage,
    required this.productManufacturer,
    required this.productName,
    required this.productPrice,
  });

  // From JSON constructor
  SportsItemModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productDescription = json['productDescription'];
    productImage = json['productImage'];
    productManufacturer = json['productManufacturer'];
    productName = json['productName'];
    productPrice = json['productPrice'];
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productDescription': productDescription,
      'productImage': productImage,
      'productManufacturer': productManufacturer,
      'productName': productName,
      'productPrice': productPrice,
    };
  }
}

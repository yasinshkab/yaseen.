class OrderDetailsModel {
  String? productsprice;
  String? productscount;
  String? cartId;
  String? cartUser;
  String? cartProduct;
  String? productId;
  String? productCode;
  String? productName;
  String? productDiscount;
  String? productImage;
  String? productCount;
  String? productPrice;
  String? productActive;
  String? productTime;
  String? productType;
  String? productPriceDiscount;

  OrderDetailsModel(
      {this.productsprice,
      this.productscount,
      this.cartId,
      this.cartUser,
      this.cartProduct,
      this.productId,
      this.productCode,
      this.productName,
      this.productDiscount,
      this.productImage,
      this.productCount,
      this.productPrice,
      this.productActive,
      this.productTime,
      this.productType,
      this.productPriceDiscount});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    productsprice = json['productsprice'];
    productscount = json['productscount'];
    cartId = json['cart_id'];
    cartUser = json['cart_user'];
    cartProduct = json['cart_product'];
    productId = json['product_id'];
    productCode = json['product_code'];
    productName = json['product_name'];
    productDiscount = json['product_discount'];
    productImage = json['product_image'];
    productCount = json['product_count'];
    productPrice = json['product_price'];
    productActive = json['product_active'];
    productTime = json['product_time'];
    productType = json['product_type'];
    productPriceDiscount = json['afterdiscountprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productsprice'] = productsprice;
    data['productscount'] = productscount;
    data['cart_id'] = cartId;
    data['cart_user'] = cartUser;
    data['cart_product'] = cartProduct;
    data['product_id'] = productId;
    data['product_code'] = productCode;
    data['product_name'] = productName;
    data['product_discount'] = productDiscount;
    data['product_image'] = productImage;
    data['product_count'] = productCount;
    data['product_price'] = productPrice;
    data['product_active'] = productActive;
    data['product_time'] = productTime;
    data['product_type'] = productType;
    data['afterdiscountprice'] = productPriceDiscount;

    return data;
  }
}

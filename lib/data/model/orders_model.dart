class OrdersModel {
  String? orderId;
  String? orderUser;
  String? orderAddress;
  String? orderDeliveryprice;
  String? orderPrice;
  String? orderCoupon;
  String? orderStatus;
  String? orderDate;
  String? addressId;
  String? addressUser;
  String? addressCity;
  String? addressRegion;
  String? addressLat;
  String? addressLong;
  String? addressName;
  String? addressNote;
  String? adderssActive;

  OrdersModel(
      {this.orderId,
      this.orderUser,
      this.orderAddress,
      this.orderDeliveryprice,
      this.orderPrice,
      this.orderCoupon,
      this.orderStatus,
      this.orderDate,
      this.addressId,
      this.addressUser,
      this.addressCity,
      this.addressRegion,
      this.addressLat,
      this.addressLong,
      this.addressName,
      this.addressNote,
      this.adderssActive});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUser = json['order_user'];
    orderAddress = json['order_address'];
    orderDeliveryprice = json['order_deliveryprice'];
    orderPrice = json['order_price'];
    orderCoupon = json['order_coupon'];
    orderStatus = json['order_status'];
    orderDate = json['order_date'];
    addressId = json['address_id'];
    addressUser = json['address_user'];
    addressCity = json['address_city'];
    addressRegion = json['address_region'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressName = json['address_name'];
    addressNote = json['address_note'];
    adderssActive = json['adderss_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = orderId;
    data['order_user'] = orderUser;
    data['order_address'] = orderAddress;
    data['order_deliveryprice'] = orderDeliveryprice;
    data['order_price'] = orderPrice;
    data['order_coupon'] = orderCoupon;
    data['order_status'] = orderStatus;
    data['order_date'] = orderDate;
    data['address_id'] = addressId;
    data['address_user'] = addressUser;
    data['address_city'] = addressCity;
    data['address_region'] = addressRegion;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_name'] = addressName;
    data['address_note'] = addressNote;
    data['adderss_active'] = adderssActive;
    return data;
  }
}

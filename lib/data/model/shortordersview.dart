class OrdersShortView {
  String? orderId;
  String? orderUser;
  String? orderAddress;
  String? orderDeliveryprice;
  String? orderPrice;
  String? orderCoupon;
  String? orderStatus;
  String? orderDate;
  String? userId;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userPassword;
  String? userVerifycode;
  String? userApprove;
  String? userCreate;

  OrdersShortView(
      {this.orderId,
      this.orderUser,
      this.orderAddress,
      this.orderDeliveryprice,
      this.orderPrice,
      this.orderCoupon,
      this.orderStatus,
      this.orderDate,
      this.userId,
      this.userName,
      this.userEmail,
      this.userPhone,
      this.userPassword,
      this.userVerifycode,
      this.userApprove,
      this.userCreate});

  OrdersShortView.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUser = json['order_user'];
    orderAddress = json['order_address'];
    orderDeliveryprice = json['order_deliveryprice'];
    orderPrice = json['order_price'];
    orderCoupon = json['order_coupon'];
    orderStatus = json['order_status'];
    orderDate = json['order_date'];
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userPassword = json['user_password'];
    userVerifycode = json['user_verifycode'];
    userApprove = json['user_approve'];
    userCreate = json['user_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_user'] = orderUser;
    data['order_address'] = orderAddress;
    data['order_deliveryprice'] = orderDeliveryprice;
    data['order_price'] = orderPrice;
    data['order_coupon'] = orderCoupon;
    data['order_status'] = orderStatus;
    data['order_date'] = orderDate;
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_phone'] = userPhone;
    data['user_password'] = userPassword;
    data['user_verifycode'] = userVerifycode;
    data['user_approve'] = userApprove;
    data['user_create'] = userCreate;
    return data;
  }
}

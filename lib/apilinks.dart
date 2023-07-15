class ApiLinks {
  static String serverLink = "https://flutter.alalemstore.com/hommer/admin";
  static String imagesLink = "https://flutter.alalemstore.com/hommer/upload";
  //////////////////////////////////////////////////////////////
  static String typeimages = "$imagesLink/type";
  static String productimages = "$imagesLink/product";
  static String sliderimages = "$imagesLink/slider";

  /////////////
  static String loginlink = "$serverLink/auth/login.php";
  static String verifycodelink = "$serverLink/auth/verifyemail.php";
  static String resetpassordlink =
      "$serverLink/auth/resetpassword/resetpassword.php";
  static String checkemaillink =
      "$serverLink/auth/resetpassword/checkemail.php";
  static String resendcodelink = "$serverLink/auth/resendcode.php";
  static String otpcodelink = "$serverLink/auth/resetpassword/otpcode.php";
  //////////////
  static String mainpagelink = "$serverLink/main/mainpage.php";
  ////////////
  static String typespagelink = "$serverLink/types/view.php";
  static String addtypelink = "$serverLink/types/add.php";
  static String edittypelink = "$serverLink/types/edit.php";
  static String deletetypelink = "$serverLink/types/delete.php";
  ////////////
  static String productspagelink = "$serverLink/products/view.php";
  static String addproductlink = "$serverLink/products/add.php";
  static String editproductlink = "$serverLink/products/edit.php";
  static String deleteproductlink = "$serverLink/products/delete.php";
  ///////////
  static String orderapprovelink = "$serverLink/orders/approve.php";
  static String orderdetailslink = "$serverLink/orders/details.php";
  static String neworderviewlink = "$serverLink/orders/viewneworders.php";

  static String orderdonelink = "$serverLink/orders/done.php";
  static String orderarchiveviewlink = "$serverLink/orders/archiveview.php";
  static String inprogressorderviewlink =
      "$serverLink/orders/viewinprogress.php";
  ////////
  static String serviceapprovelink = "$serverLink/serviceorder/approve.php";
  static String acserviceslink = "$serverLink/serviceorder/newacservices.php";
  static String wmserviceslink = "$serverLink/serviceorder/newwmservices.php";
  static String acarchivelink =
      "$serverLink/serviceorder/acservicesarchive.php";
  static String wmarchivelink =
      "$serverLink/serviceorder/wmservicesarchive.php";
  static String servicecancellink = "$serverLink/serviceorder/cancel.php";

  /////
  static String notificationlink = "$serverLink/notification/notification.php";
  ///////
  static String slideraddlink = "$serverLink/slider/add.php";
  static String sliderdeletelink = "$serverLink/slider/delete.php";
  static String sliderviewlink = "$serverLink/slider/view.php";
}

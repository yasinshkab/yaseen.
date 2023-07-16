import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hommer_admin/controller/dashboardcontrol.dart';
import 'package:hommer_admin/controller/products_control.dart';
import 'package:hommer_admin/controller/sections/main.control.dart';
import 'package:hommer_admin/controller/services/acarchive.control.dart';
import 'package:hommer_admin/controller/services/acservices.control.dart';
import 'package:hommer_admin/controller/services/wmarchive.control.dart';
import 'package:hommer_admin/controller/services/wmservices.control.dart';
import 'package:hommer_admin/controller/typecontroller.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';
import 'package:hommer_admin/view/screen/mainsection/main_page.dart';
import 'package:hommer_admin/view/screen/mainsection/notification_page.dart';
import 'package:hommer_admin/view/screen/mainsection/order/archive.dart';
import 'package:hommer_admin/view/screen/mainsection/order/inprogress.dart';
import 'package:hommer_admin/view/screen/mainsection/order/neworders_page.dart';
import 'package:hommer_admin/view/screen/mainsection/products_page.dart';
import 'package:hommer_admin/view/screen/mainsection/services/acservicesarchive.dart';
import 'package:hommer_admin/view/screen/mainsection/services/newacservices.dart';
import 'package:hommer_admin/view/screen/mainsection/services/newwmservices.dart';
import 'package:hommer_admin/view/screen/mainsection/services/wmarchive.dart';
import 'package:hommer_admin/view/screen/mainsection/slider.dart';
import 'package:hommer_admin/view/screen/mainsection/types_page.dart';
import 'package:hommer_admin/view/widget/listtile_item.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  DashBoardControllerImp control = Get.put(DashBoardControllerImp());
  int _selectedIndex = 0;
  // bool _showDrawer = true;
  bool _isExpanded = false;
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _toggleExpanded1() {
    setState(() {
      isExpanded1 = !isExpanded1;
    });
  }

  void _toggleExpanded2() {
    setState(() {
      isExpanded2 = !isExpanded2;
    });
  }

  void _toggleExpanded3() {
    setState(() {
      isExpanded3 = !isExpanded3;
    });
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            // Use bottom navigation bar for small screens
            return Scaffold(
              body: _pages[_selectedIndex],
              // bottomNavigationBar: BottomNavigationBar(
              //   items: [
              //     const BottomNavigationBarItem(
              //       icon: Icon(Icons.dashboard),
              //       label: 'Dashboard',
              //       backgroundColor: Colors.blue,
              //     ),
              //     const BottomNavigationBarItem(
              //       icon: Icon(Icons.people),
              //       label: 'Users',
              //       backgroundColor: Colors.blue,
              //     ),
              //     const BottomNavigationBarItem(
              //       icon: Icon(Icons.shopping_cart),
              //       label: 'Products',
              //       backgroundColor: Colors.blue,
              //     ),
              //     const BottomNavigationBarItem(
              //       icon: Icon(Icons.shopping_bag),
              //       label: 'Orders',
              //       backgroundColor: Colors.blue,
              //     ),
              //   ],
              //   currentIndex: _selectedIndex,
              //   selectedItemColor: Colors.white,
              //   unselectedItemColor: Colors.grey,
              //   onTap: _onItemTap,
              // ),
            );
          } else {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Drawer(
                    shadowColor: const Color.fromRGBO(255, 255, 255, 0),
                    backgroundColor: const Color.fromRGBO(227, 29, 26, 1),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[350],
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 75,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${control.name}",
                              style: drawerName,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        ///

                        ////
                        ///
                        Wrap(runSpacing: 10, children: [
                          listTileItem(
                            onTap: () {
                              Get.delete<MainPageControllerImp>();

                              Future.delayed(const Duration(milliseconds: 1))
                                  .then((value) => _onItemTap(0));
                            },
                            title: "الرئيسية",
                            selected: _selectedIndex == 0,
                          ),
                          ListTile(
                            textColor: Colors.white,
                            title: Text(
                              "الطلبات",
                              style: draweritem,
                            ),
                            onTap: () {
                              _toggleExpanded();
                            },
                          ),
                          if (_isExpanded)
                            Column(
                              children: [
                                ListTile(
                                  textColor: Colors.white,
                                  title: Text(
                                    "طلبات الشراء",
                                    style: drawersubitem,
                                  ),
                                  onTap: () {
                                    _toggleExpanded1();
                                  },
                                ),
                                if (isExpanded1)
                                  Container(
                                    color: const Color.fromRGBO(209, 29, 34, 1),
                                    child: Column(children: [
                                      sublistTileItem(
                                        onTap: () {
                                          // Get.delete<MainPageControllerImp>();

                                          Future.delayed(
                                                  const Duration(milliseconds: 1))
                                              .then((value) => _onItemTap(2));
                                        },
                                        title: "الطلبات الجديدة",
                                        selected: _selectedIndex == 2,
                                      ),
                                      sublistTileItem(
                                        onTap: () {
                                          // Get.delete<MainPageControllerImp>();

                                          Future.delayed(
                                                  const Duration(milliseconds: 1))
                                              .then((value) => _onItemTap(6));
                                        },
                                        title: "الطلبات قيد التنفيذ",
                                        selected: _selectedIndex == 6,
                                      ),
                                      sublistTileItem(
                                        onTap: () {
                                          // Get.delete<MainPageControllerImp>();

                                          Future.delayed(
                                                  const Duration(milliseconds: 1))
                                              .then((value) => _onItemTap(7));
                                        },
                                        title: "الأرشيف",
                                        selected: _selectedIndex == 7,
                                      ),
                                    ]),
                                  ),
                                ListTile(
                                  textColor: Colors.white,
                                  title: Text(
                                    "طلبات الخدمة",
                                    style: drawersubitem,
                                  ),
                                  onTap: () {
                                    _toggleExpanded2();
                                  },
                                ),
                                if (isExpanded2)
                                  Container(
                                    color: const Color.fromRGBO(209, 29, 34, 1),
                                    child: Column(children: [
                                      sublistTileItem(
                                        onTap: () {
                                          Get.delete<ACservicesControllerImp>();

                                          Future.delayed(
                                                  const Duration(milliseconds: 1))
                                              .then((value) => _onItemTap(8));
                                        },
                                        title: "طلبات التكييف",
                                        selected: _selectedIndex == 8,
                                      ),
                                      sublistTileItem(
                                        onTap: () {
                                          Get.delete<ACArchiveControllerImp>();

                                          Future.delayed(
                                                  const Duration(milliseconds: 1))
                                              .then((value) => _onItemTap(9));
                                        },
                                        title: "أرشيف طلبات التكييف",
                                        selected: _selectedIndex == 9,
                                      ),
                                      sublistTileItem(
                                        onTap: () {
                                          Get.delete<WMservicesControllerImp>();

                                          Future.delayed(
                                                  const Duration(milliseconds: 1))
                                              .then((value) => _onItemTap(10));
                                        },
                                        title: "طلبات الغسالات",
                                        selected: _selectedIndex == 10,
                                      ),
                                      sublistTileItem(
                                        onTap: () {
                                          Get.delete<WMArchiveControllerImp>();

                                          Future.delayed(
                                                  const Duration(milliseconds: 1))
                                              .then((value) => _onItemTap(11));
                                        },
                                        title: "أرشيف طلبات الغسالات",
                                        selected: _selectedIndex == 11,
                                      ),
                                    ]),
                                  ),
                              ],
                            ),
                          listTileItem(
                            onTap: () {
                              Get.delete<ProductsControllerImp>();

                              Future.delayed(const Duration(milliseconds: 1))
                                  .then((value) => _onItemTap(3));
                            },
                            title: "المنتجات",
                            selected: _selectedIndex == 3,
                          ),
                          listTileItem(
                            onTap: () {
                              Get.delete<TypeAddControllerImp>();

                              Future.delayed(const Duration(milliseconds: 1))
                                  .then((value) => _onItemTap(4));
                            },
                            title: "الأنواع",
                            selected: _selectedIndex == 4,
                          ),
                          listTileItem(
                            onTap: () {
                              //Get.delete<HomepageConrolloerImp>();

                              Future.delayed(const Duration(milliseconds: 1))
                                  .then((value) => _onItemTap(1));
                            },
                            title: "الإشعارات",
                            selected: _selectedIndex == 1,
                          ),
                          ListTile(
                            textColor: Colors.white,
                            title: Text(
                              "تعديل التطبيق",
                              style: draweritem,
                            ),
                            onTap: () {
                              _toggleExpanded3();
                            },
                          ),
                          if (isExpanded3)
                            Container(
                              color: const Color.fromRGBO(209, 29, 34, 1),
                              child: Column(children: [
                                sublistTileItem(
                                  onTap: () {
                                    //Get.delete<HomepageConrolloerImp>();

                                    Future.delayed(const Duration(milliseconds: 1))
                                        .then((value) => _onItemTap(5));
                                  },
                                  title: "Slider",
                                  selected: _selectedIndex == 5,
                                ),
                              ]),
                            ),
                        ]),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(child: _pages[_selectedIndex]),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

List<Widget> _pages = [
  const MainPage(),
  const NotificationPage(),
  const NewOrdersPage(),
  const ProductsPage(),
  const TypesPage(),
  const SliderPage(),
  const InprogressOrders(),
  const OrdersArchive(),
  const ACServices(),
  const ACServicesArchive(),
  const WMServices(),
  const WMServicesArchive()
];

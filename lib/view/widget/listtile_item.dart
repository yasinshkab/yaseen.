import 'package:flutter/material.dart';
import 'package:hommer_admin/core/constant/text_theme.dart';

listTileItem(
        {required String title,
        required bool selected,
        required Function()? onTap}) =>
    ListTile(
        textColor: Colors.white,
        selectedTileColor: Colors.white,
        title: Text(
          title,
          style: draweritem,
        ),
        selected: selected,
        //_selectedIndex == 0,
        onTap: onTap
        //  () {
        //   _onItemTap(0);
        //   // _toggleDrawer();
        // },
        );
sublistTileItem(
        {required String title,
        required bool selected,
        required Function()? onTap}) =>
    ListTile(
        textColor: Colors.white,
        selectedTileColor: Colors.white,
        title: Text(
          title,
          style: smallsubitem,
        ),
        selected: selected,
        //_selectedIndex == 0,
        onTap: onTap
        //  () {
        //   _onItemTap(0);
        //   // _toggleDrawer();
        // },
        );

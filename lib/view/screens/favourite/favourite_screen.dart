import 'package:medibott/controller/auth_controller.dart';
import 'package:medibott/controller/splash_controller.dart';
import 'package:medibott/util/dimensions.dart';
import 'package:medibott/util/styles.dart';
import 'package:medibott/view/base/custom_app_bar.dart';
import 'package:medibott/view/base/menu_drawer.dart';
import 'package:medibott/view/base/not_logged_in_screen.dart';
import 'package:medibott/view/screens/favourite/widget/fav_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'favourite'.tr, backButton: false),
      endDrawer: MenuDrawer(),
      body: Get.find<AuthController>().isLoggedIn()
          ? SafeArea(
              child: Column(children: [
              Container(
                width: Dimensions.WEB_MAX_WIDTH,
                color: Theme.of(context).cardColor,
              ),
              Expanded(
                child: FavItemView(isStore: false),
              )
            ]))
          : NotLoggedInScreen(),
    );
  }
}

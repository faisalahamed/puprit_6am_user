import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medibott/data/model/response/category_model.dart';
import 'package:medibott/data/repository/category_repo.dart';
import 'package:medibott/helper/responsive_helper.dart';
import 'package:medibott/util/dimensions.dart';
import 'package:medibott/view/new_screens/account/account.dart';
import 'package:medibott/view/new_screens/appbar/appbar_content.dart';
import 'package:medibott/view/new_screens/bulk_data.dart';
import 'package:medibott/view/new_screens/cart_item/product_card_item.dart';
import 'package:medibott/view/new_screens/colors.dart';
import 'package:medibott/view/new_screens/my_orders/my_orders.dart';
import 'package:medibott/view/new_screens/notification/notification.dart';
import 'package:medibott/view/new_screens/prescription/my_prescription_page.dart';
import 'package:medibott/view/new_screens/request_medicine/request_medicine_page.dart';
import 'package:medibott/view/new_screens/search/search_product.dart';
import 'package:medibott/view/screens/home/widget/category_view.dart';
import 'package:medibott/view/screens/menu/menu_screen.dart';

import '../../screens/dashboard/widget/bottom_nav_item.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({Key key}) : super(key: key);

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  List<CategoryModel> _categoryList;
  CategoryRepo categoryRepo;

  Future<String> getCategoryList() async {
    _categoryList = null;
    Response response = await categoryRepo.getCategoryList(true);
    if (response.statusCode == 200) {
      response.body.forEach((category) {
        _categoryList.add(CategoryModel.fromJson(category));

        print(_categoryList);
      });
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          children: [
            /// Top Part with title and cart icon
            const AppBarContent(),

            ///Search bar
            SearchProduct(
              scaffoldKey: scaffoldKey,
            ),

            ///Horizontal list of categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              // child: [SizedBox(),CategoryView()]

              child: Row(
                children: List.generate(
                    categoryList.length,
                    (index) => InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => const CategoryPage()));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: 60,
                            child: Column(
                              children: [
                                Image.network(
                                  categoryList[index].image,
                                  height: 40,
                                ),
                                SizedBox(
                                    child: Text(
                                  categoryList[index].title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12),
                                )),
                              ],
                            ),
                          ),
                        )),
              ),
            ),
            FutureBuilder(
                future: getCategoryList(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('data');
                  } else {
                    return Text('no');
                  }
                })),

            ///Promotion Banner
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 120,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  image: AssetImage('assets/image/new_assets/home_banner.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// offer category with color
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 6, top: 8, right: 6),
                    height: 145.0,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFB6D6E8), Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(color: const Color(0xFFB6D6E8)),
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Upload \nprescripton",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'UPTO 10% \nOFF + Cashback',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.red),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.play_circle,
                                  size: 20,
                                  color: Color(0xFF0075AD),
                                ),
                                Image.asset(
                                    'assets/image/new_assets/prescription_icon.png',
                                    height: 40),
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      callNumber();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 6, top: 8, right: 6),
                      height: 145.0,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFB4E5CC), Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(color: const Color(0xFFB4E5CC)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Call to Order \n10am To 10pm",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'UPTO 10% \nOFF + Cashback',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.play_circle,
                                    size: 20,
                                    color: Color(0xFF00A858),
                                  ),
                                  Image.asset(
                                      'assets/image/new_assets/call_icon.png',
                                      height: 40),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (_) => const CategoryPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 6, top: 8, right: 6),
                      height: 145.0,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFDECB7), Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(color: const Color(0xFFFDECB7)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Healthcare \nProduct",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'UPTO 60% \nOFF + Cashback',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.play_circle,
                                    size: 20,
                                    color: Color(0xFFFEBC35),
                                  ),
                                  Image.asset(
                                      'assets/image/new_assets/health_care_icon.png',
                                      height: 40),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            /// play video demo
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              child: Wrap(
                spacing: 6,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(Icons.play_arrow),
                  Text('How to order from onest pharma App')
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            ///category section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Covid-19 Special',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) => const ProductCardItem(),
                ),
              ),
            ),
            const SizedBox(height: 20.0),

            ///category section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Covid-19 Special',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) => const ProductCardItem(),
                ),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            ListTile(
                dense: false,
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.person,
                      size: 35,
                      color: Color(0xFF464D54),
                    ),
                  ],
                ),
                title: const Text(
                  "Account",
                  style: TextStyle(
                      color: Color(0xFF464D54),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                subtitle: const Text(
                  "arrogga cash: ₹0.00",
                  style: TextStyle(color: Color(0xFF464D54)),
                )),
            const Divider(
              indent: 12,
              endIndent: 12,
              color: Colors.black,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: getDrawerItemList().length,
                itemBuilder: (context, index) {
                  final DrawerModel item = getDrawerItemList().elementAt(index);

                  return ListTile(
                      dense: true,
                      onTap: () =>
                          Navigator.push(context, item.type.navigateToScreen),
                      leading: Icon(
                        item.icon,
                        size: 35,
                        color: AppColors.colorPrimary,
                      ),
                      title: Text(
                        item.title,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      subtitle: Text(
                        item.subTitle,
                        style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
      // drawer: Drawer(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       const SizedBox(
      //         height: 35,
      //       ),
      //       ListTile(
      //           dense: false,
      //           leading: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: const [
      //               Icon(
      //                 Icons.person,
      //                 size: 35,
      //                 color: Color(0xFF464D54),
      //               ),
      //             ],
      //           ),
      //           title: const Text(
      //             "Account",
      //             style: TextStyle(
      //                 color: Color(0xFF464D54),
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 18),
      //           ),
      //           subtitle: const Text(
      //             "Medibott cash: ₹0.00",
      //             style: TextStyle(color: Color(0xFF464D54)),
      //           )),
      //       const Divider(
      //         indent: 12,
      //         endIndent: 12,
      //         color: Colors.black,
      //       ),
      //       ListView.builder(
      //         shrinkWrap: true,
      //         padding: EdgeInsets.zero,
      //         itemCount: getDrawerItemList().length,
      //         itemBuilder: (context, index) {
      //           final DrawerModel item = getDrawerItemList().elementAt(index);

      //           return ListTile(
      //               dense: true,
      //               onTap: () =>
      //                   Navigator.push(context, item.type.navigateToScreen),
      //               leading: Icon(
      //                 item.icon,
      //                 size: 35,
      //                 color: AppColors.colorPrimary,
      //               ),
      //               title: Text(
      //                 item.title,
      //                 style: const TextStyle(
      //                     color: Colors.black87,
      //                     fontWeight: FontWeight.w500,
      //                     fontSize: 14),
      //               ),
      //               subtitle: Text(
      //                 item.subTitle,
      //                 style: const TextStyle(
      //                     color: Colors.black54,
      //                     fontWeight: FontWeight.w400,
      //                     fontSize: 12),
      //               ));
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: ResponsiveHelper.isDesktop(context)
      //     ? SizedBox()
      //     : BottomAppBar(
      //         elevation: 5,
      //         notchMargin: 5,
      //         clipBehavior: Clip.antiAlias,
      //         shape: CircularNotchedRectangle(),
      //         child: Padding(
      //           padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
      //           child: Row(children: [
      //             BottomNavItem(
      //                 iconData: Icons.home,
      //                 isSelected: _pageIndex == 0,
      //                 onTap: () => _setPage(0)),
      //             BottomNavItem(
      //                 iconData: Icons.favorite,
      //                 isSelected: _pageIndex == 1,
      //                 onTap: () => _setPage(1)),
      //             Expanded(child: SizedBox()),
      //             BottomNavItem(
      //                 iconData: Icons.shopping_bag,
      //                 isSelected: _pageIndex == 3,
      //                 onTap: () => _setPage(3)),
      //             BottomNavItem(
      //                 iconData: Icons.menu,
      //                 isSelected: _pageIndex == 4,
      //                 onTap: () {
      //                   Get.bottomSheet(MenuScreen(),
      //                       backgroundColor: Colors.transparent,
      //                       isScrollControlled: true);
      //                 }),
      //           ]),
      //         ),
      //       ),
    );
  }

  // void _setPage(int pageIndex) {
  callNumber() async {
    const number = '01951043844'; //set the number here
    // bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}

List<DrawerModel> getDrawerItemList() {
  return [
    DrawerModel(
        title: 'Notification',
        subTitle: 'Read Notification',
        icon: Icons.notifications_none,
        type: DrawerType.notification),
    DrawerModel(
        title: 'My Account',
        subTitle: 'View Account Details',
        icon: Icons.account_circle_outlined,
        type: DrawerType.account),
    DrawerModel(
        title: 'My Orders',
        subTitle: 'View previous order',
        icon: CupertinoIcons.shopping_cart,
        type: DrawerType.order),
    DrawerModel(
        title: 'My Prescriptions',
        subTitle: 'All uploaded prescriptions',
        icon: Icons.accessible_sharp,
        type: DrawerType.prescription),
    DrawerModel(
        title: 'Special Offers',
        subTitle: 'Exclusive discount just for you',
        icon: Icons.offline_bolt_outlined,
        type: DrawerType.offer),
    DrawerModel(
        title: 'Request Medicine',
        subTitle: 'Request medicine/health products to add',
        icon: Icons.add_box_outlined,
        type: DrawerType.medicine),
    DrawerModel(
        title: 'Refer And Earn',
        subTitle: '40 Taka bonus for every refer',
        icon: Icons.reduce_capacity,
        type: DrawerType.refer),
    DrawerModel(
        title: 'Call to Order',
        subTitle: '01810117100',
        icon: Icons.phone,
        type: DrawerType.call),
    DrawerModel(
        title: 'FAQs',
        subTitle: 'Rate us on play store',
        icon: Icons.question_answer_outlined,
        type: DrawerType.faq),
    DrawerModel(
        title: 'Facebook Page',
        subTitle: 'Find us on Facebook',
        icon: Icons.tag_faces,
        type: DrawerType.facebook),
  ];
}

enum DrawerType {
  notification,
  account,
  order,
  prescription,
  offer,
  medicine,
  refer,
  call,
  faq,
  facebook
}

extension on DrawerType {
  get navigateToScreen {
    switch (this) {
      case DrawerType.account:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      case DrawerType.notification:
        return MaterialPageRoute(builder: (_) => const NotificationPage());
      case DrawerType.order:
        return MaterialPageRoute(builder: (_) => const MyOrders());
      case DrawerType.prescription:
        return MaterialPageRoute(builder: (_) => const MyPrescriptionPage());
      case DrawerType.medicine:
        return MaterialPageRoute(builder: (_) => const RequestMedicinePage());
      default:
        const NewHomeScreen();
    }
  }
}

class DrawerModel {
  final String title;
  final String subTitle;
  final IconData icon;
  final DrawerType type;

  DrawerModel(
      {@required this.title,
      @required this.subTitle,
      @required this.icon,
      @required this.type});
}

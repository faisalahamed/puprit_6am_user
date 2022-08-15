import 'dart:ffi';

import 'package:medibott/controller/brand_controller.dart';
// import 'package:medibott/controller/category_controller.dart';
import 'package:medibott/controller/localization_controller.dart';
import 'package:medibott/controller/splash_controller.dart';
import 'package:medibott/data/model/response/item_model.dart';
import 'package:medibott/data/model/response/store_model.dart';
import 'package:medibott/helper/responsive_helper.dart';
import 'package:medibott/helper/route_helper.dart';
import 'package:medibott/util/app_constants.dart';
import 'package:medibott/util/dimensions.dart';
import 'package:medibott/util/styles.dart';
import 'package:medibott/view/base/cart_widget.dart';
import 'package:medibott/view/base/custom_image.dart';
import 'package:medibott/view/base/item_view.dart';
import 'package:medibott/view/base/menu_drawer.dart';
import 'package:medibott/view/base/web_menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandItemScreen extends StatefulWidget {
  final String categoryID;
  final String categoryName;
  final String brandImage;
  BrandItemScreen(
      {@required this.categoryID,
      @required this.categoryName,
      @required this.brandImage});

  @override
  _BrandItemScreenState createState() => _BrandItemScreenState();
}

class _BrandItemScreenState extends State<BrandItemScreen>
    with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final ScrollController storeScrollController = ScrollController();
  final bool _ltr = Get.find<LocalizationController>().isLtr;
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 1, initialIndex: 0, vsync: this);
    Get.find<BrandController>().getSubCategoryList(widget.categoryID);
    scrollController?.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          Get.find<BrandController>().categoryItemList != null &&
          !Get.find<BrandController>().isLoading) {
        int pageSize = (Get.find<BrandController>().pageSize / 10).ceil();
        if (Get.find<BrandController>().offset < pageSize) {
          print('end of the page');
          Get.find<BrandController>().showBottomLoader();
          Get.find<BrandController>().getCategoryItemList(
            Get.find<BrandController>().subCategoryIndex == 0
                ? widget.categoryID
                : Get.find<BrandController>()
                    .subCategoryList[
                        Get.find<BrandController>().subCategoryIndex]
                    .id
                    .toString(),
            Get.find<BrandController>().offset + 1,
            Get.find<BrandController>().type,
            false,
          );
        }
      }
    });
    storeScrollController?.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          Get.find<BrandController>().categoryStoreList != null &&
          !Get.find<BrandController>().isLoading) {
        int pageSize = (Get.find<BrandController>().restPageSize / 10).ceil();
        if (Get.find<BrandController>().offset < pageSize) {
          print('end of the page');
          Get.find<BrandController>().showBottomLoader();
          Get.find<BrandController>().getCategoryStoreList(
            Get.find<BrandController>().subCategoryIndex == 0
                ? widget.categoryID
                : Get.find<BrandController>()
                    .subCategoryList[
                        Get.find<BrandController>().subCategoryIndex]
                    .id
                    .toString(),
            Get.find<BrandController>().offset + 1,
            Get.find<BrandController>().type,
            false,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BrandController>(builder: (brandController) {
      List<Item> _item;
      List<Store> _stores;
      if (brandController.categoryItemList != null &&
          brandController.searchItemList != null) {
        _item = [];
        if (brandController.isSearching) {
          _item.addAll(brandController.searchItemList);
        } else {
          _item.addAll(brandController.categoryItemList);
        }
      }
      if (brandController.categoryStoreList != null &&
          brandController.searchStoreList != null) {
        _stores = [];
        if (brandController.isSearching) {
          _stores.addAll(brandController.searchStoreList);
        } else {
          _stores.addAll(brandController.categoryStoreList);
        }
      }

      return WillPopScope(
        onWillPop: () async {
          if (brandController.isSearching) {
            brandController.toggleSearch();
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: ResponsiveHelper.isDesktop(context)
              ? WebMenuBar()
              : AppBar(
                  title: brandController.isSearching
                      ? TextField(
                          autofocus: true,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            border: InputBorder.none,
                          ),
                          style: robotoRegular.copyWith(
                              fontSize: Dimensions.fontSizeLarge),
                          onSubmitted: (String query) =>
                              brandController.searchData(
                            query,
                            brandController.subCategoryIndex == 0
                                ? widget.categoryID
                                : brandController
                                    .subCategoryList[
                                        brandController.subCategoryIndex]
                                    .id
                                    .toString(),
                            brandController.type,
                          ),
                        )
                      : Text(widget.categoryName,
                          style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeLarge,
                            color: Theme.of(context).textTheme.bodyText2.color,
                          )),
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Theme.of(context).textTheme.bodyText2.color,
                    onPressed: () {
                      if (brandController.isSearching) {
                        brandController.toggleSearch();
                      } else {
                        Get.back();
                      }
                    },
                  ),
                  backgroundColor: Theme.of(context).cardColor,
                  elevation: 0,
                  actions: [
                    IconButton(
                      onPressed: () => brandController.toggleSearch(),
                      icon: Icon(
                        brandController.isSearching
                            ? Icons.close_sharp
                            : Icons.search,
                        color: Theme.of(context).textTheme.bodyText1.color,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.toNamed(RouteHelper.getCartRoute()),
                      icon: CartWidget(
                          color: Theme.of(context).textTheme.bodyText2.color,
                          size: 25),
                    ),
                  ],
                ),
          endDrawer: MenuDrawer(),
          body: SizedBox(
            width: Dimensions.WEB_MAX_WIDTH,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (brandController.subCategoryList != null &&
                          !brandController.isSearching)
                      ? Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Theme.of(context).disabledColor,
                          ),
                          // color: Theme.of(context).cardColor,
                          margin: EdgeInsets.only(left: 20),
                          // padding: EdgeInsets.symmetric(
                          //     vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          // child: Icon(Icons.image),
                          child: CustomImage(
                            image: AppConstants.BRAND_IMAGE_URI +
                                '/${widget.brandImage}',
                            // height: 50,
                            // width: 50,
                            // fit: BoxFit.cover,
                          ),
                          // !All sub list
                          // child: ListView.builder(
                          //   scrollDirection: Axis.horizontal,
                          //   // itemCount: brandController.subCategoryList.length,
                          //   itemCount: 1,
                          //   padding: EdgeInsets.only(
                          //       left: Dimensions.PADDING_SIZE_SMALL),
                          //   physics: BouncingScrollPhysics(),
                          //   itemBuilder: (context, index) {
                          //     return InkWell(
                          //       onTap: () => brandController.setSubCategoryIndex(
                          //           index, widget.categoryID),
                          //       child: Container(
                          //         padding: EdgeInsets.only(
                          //           left: index == 0
                          //               ? Dimensions.PADDING_SIZE_LARGE
                          //               : Dimensions.PADDING_SIZE_SMALL,
                          //           right: index ==
                          //                   brandController.subCategoryList.length -
                          //                       1
                          //               ? Dimensions.PADDING_SIZE_LARGE
                          //               : Dimensions.PADDING_SIZE_SMALL,
                          //           top: Dimensions.PADDING_SIZE_SMALL,
                          //         ),
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.horizontal(
                          //             left: Radius.circular(
                          //               _ltr
                          //                   ? index == 0
                          //                       ? Dimensions.RADIUS_EXTRA_LARGE
                          //                       : 0
                          //                   : index ==
                          //                           brandController.subCategoryList
                          //                                   .length -
                          //                               1
                          //                       ? Dimensions.RADIUS_EXTRA_LARGE
                          //                       : 0,
                          //             ),
                          //             right: Radius.circular(
                          //               _ltr
                          //                   ? index ==
                          //                           brandController.subCategoryList
                          //                                   .length -
                          //                               1
                          //                       ? Dimensions.RADIUS_EXTRA_LARGE
                          //                       : 0
                          //                   : index == 0
                          //                       ? Dimensions.RADIUS_EXTRA_LARGE
                          //                       : 0,
                          //             ),
                          //           ),
                          //           color: Theme.of(context)
                          //               .primaryColor
                          //               .withOpacity(0.1),
                          //         ),
                          //         child: Column(children: [
                          //           SizedBox(height: 3),
                          //           Text(
                          //             brandController.subCategoryList[index].name,
                          //             style: index ==
                          //                     brandController.subCategoryIndex
                          //                 ? robotoMedium.copyWith(
                          //                     fontSize: Dimensions.fontSizeSmall,
                          //                     color: Theme.of(context).primaryColor)
                          //                 : robotoRegular.copyWith(
                          //                     fontSize: Dimensions.fontSizeSmall,
                          //                     color:
                          //                         Theme.of(context).disabledColor),
                          //           ),
                          //           index == brandController.subCategoryIndex
                          //               ? Container(
                          //                   height: 5,
                          //                   width: 5,
                          //                   decoration: BoxDecoration(
                          //                       color:
                          //                           Theme.of(context).primaryColor,
                          //                       shape: BoxShape.circle),
                          //                 )
                          //               : SizedBox(height: 5, width: 5),
                          //         ]),
                          //       ),
                          //     );
                          //   },
                          // ),
                        )
                      : SizedBox(),
                  // Center(
                  //     child: Container(

                  //   width: Dimensions.WEB_MAX_WIDTH,
                  //   color: Theme.of(context).cardColor,
                  //   child: TabBar(
                  //     controller: _tabController,
                  //     indicatorColor: Theme.of(context).primaryColor,
                  //     indicatorWeight: 3,
                  //     labelColor: Theme.of(context).primaryColor,
                  //     unselectedLabelColor: Theme.of(context).disabledColor,
                  //     unselectedLabelStyle: robotoRegular.copyWith(
                  //         color: Theme.of(context).disabledColor,
                  //         fontSize: Dimensions.fontSizeSmall),
                  //     labelStyle: robotoBold.copyWith(
                  //         fontSize: Dimensions.fontSizeSmall,
                  //         color: Theme.of(context).primaryColor),
                  //     tabs: [
                  //       Tab(text: 'item'.tr),
                  //       // Tab(text: Get.find<SplashController>().configModel.moduleConfig.module.showRestaurantText
                  //       //     ? 'restaurants'.tr : 'stores'.tr),
                  //     ],
                  //   ),
                  // )),
                  // VegFilterWidget(
                  //     type: catController.type,
                  //     onSelected: (String type) {
                  //       if (catController.isSearching) {
                  //         catController.searchData(
                  //           catController.subCategoryIndex == 0
                  //               ? widget.categoryID
                  //               : catController
                  //                   .subCategoryList[catController.subCategoryIndex]
                  //                   .id
                  //                   .toString(),
                  //           '1',
                  //           type,
                  //         );
                  //       } else {
                  //         if (catController.isStore) {
                  //           catController.getCategoryStoreList(
                  //             catController.subCategoryIndex == 0
                  //                 ? widget.categoryID
                  //                 : catController
                  //                     .subCategoryList[
                  //                         catController.subCategoryIndex]
                  //                     .id
                  //                     .toString(),
                  //             1,
                  //             type,
                  //             true,
                  //           );
                  //         } else {
                  //           catController.getCategoryItemList(
                  //             catController.subCategoryIndex == 0
                  //                 ? widget.categoryID
                  //                 : catController
                  //                     .subCategoryList[
                  //                         catController.subCategoryIndex]
                  //                     .id
                  //                     .toString(),
                  //             1,
                  //             type,
                  //             true,
                  //           );
                  //         }
                  //       }
                  //     }),

                  Expanded(
                    child: NotificationListener(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollEndNotification) {
                          if ((_tabController.index == 1 &&
                                  !brandController.isStore) ||
                              _tabController.index == 0 &&
                                  brandController.isStore) {
                            brandController
                                .setRestaurant(_tabController.index == 1);
                            if (brandController.isSearching) {
                              brandController.searchData(
                                brandController.searchText,
                                brandController.subCategoryIndex == 0
                                    ? widget.categoryID
                                    : brandController
                                        .subCategoryList[
                                            brandController.subCategoryIndex]
                                        .id
                                        .toString(),
                                brandController.type,
                              );
                            } else {
                              if (_tabController.index == 1) {
                                brandController.getCategoryStoreList(
                                  brandController.subCategoryIndex == 0
                                      ? widget.categoryID
                                      : brandController
                                          .subCategoryList[
                                              brandController.subCategoryIndex]
                                          .id
                                          .toString(),
                                  1,
                                  brandController.type,
                                  false,
                                );
                              } else {
                                brandController.getCategoryItemList(
                                  brandController.subCategoryIndex == 0
                                      ? widget.categoryID
                                      : brandController
                                          .subCategoryList[
                                              brandController.subCategoryIndex]
                                          .id
                                          .toString(),
                                  1,
                                  brandController.type,
                                  false,
                                );
                              }
                            }
                          }
                        }
                        return false;
                      },
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: ItemsView(
                          isStore: false,
                          items: _item,
                          stores: null,
                          noDataText: 'no_category_item_found'.tr,
                        ),
                      ),
                      // SingleChildScrollView(
                      //   controller: storeScrollController,
                      //   child: ItemsView(
                      //     isStore: true, items: null, stores: _stores,
                      //     noDataText: Get.find<SplashController>().configModel.moduleConfig.module.showRestaurantText
                      //         ? 'no_category_restaurant_found'.tr : 'no_category_store_found'.tr,
                      //   ),
                      // ),
                    ),
                  ),
                  brandController.isLoading
                      ? Center(
                          child: Padding(
                          padding:
                              EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor)),
                        ))
                      : SizedBox(),
                ]),
          ),
        ),
      );
    });
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class BrandItemScreen extends StatelessWidget {
//   final String categoryID;
//   final String categoryName;
//   BrandItemScreen({@required this.categoryID, @required this.categoryName});

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('brand'));
//   }
// }

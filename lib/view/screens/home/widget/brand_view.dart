import 'package:medibott/controller/brand_controller.dart';
import 'package:medibott/controller/category_controller.dart';
import 'package:medibott/controller/splash_controller.dart';
import 'package:medibott/helper/responsive_helper.dart';
import 'package:medibott/helper/route_helper.dart';
import 'package:medibott/util/app_constants.dart';
import 'package:medibott/util/dimensions.dart';
import 'package:medibott/util/styles.dart';
import 'package:medibott/view/base/custom_image.dart';
import 'package:medibott/view/base/title_widget.dart';
import 'package:medibott/view/screens/home/widget/category_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:get/get.dart';

class BrandView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    return GetBuilder<BrandController>(builder: (brandController) {
      return (brandController.categoryList != null &&
              brandController.categoryList.length == 0)
          ? SizedBox()
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TitleWidget(
                    title: 'brand_title'.tr,
                    // onTap: () => Get.toNamed(RouteHelper.getCategoryRoute()),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // color: Colors.amberAccent,

                        padding: EdgeInsets.only(top: 6, left: 4),
                        height: 250,
                        child: brandController.categoryList != null
                            ? GridView.builder(
                                // physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 6.0,
                                  mainAxisSpacing: 6.0,
                                ),
                                controller: _scrollController,
                                itemCount:
                                    brandController.categoryList.length > 15
                                        ? 15
                                        : brandController.categoryList.length,
                                padding: EdgeInsets.only(
                                    left: Dimensions.PADDING_SIZE_SMALL),
                                // physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    // !
                                    // onTap: () => Get.toNamed(
                                    //     RouteHelper.getCategoryItemRoute(
                                    //   brandController.categoryList[index].id,
                                    //   brandController.categoryList[index].name,
                                    // )),
                                    onTap: () => Get.toNamed(
                                        RouteHelper.getBrandItemRoute(
                                      brandController.categoryList[index].id,
                                      brandController.categoryList[index].name,
                                    )),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.RADIUS_SMALL),
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       color: Colors.grey[
                                        //           Get.isDarkMode ? 800 : 200],
                                        //       spreadRadius: 1,
                                        //       blurRadius: 5)
                                        // ],
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(1),
                                        child: Stack(children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.RADIUS_SMALL),
                                            child: CustomImage(
                                              image: AppConstants
                                                      .BRAND_IMAGE_URI +
                                                  '/${brandController.categoryList[index].image}',
                                              // height: 50,
                                              // width: 50,
                                              // fit: BoxFit.cover,
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : CategoryShimmer(
                                categoryController: brandController),
                      ),
                    ),
                    ResponsiveHelper.isMobile(context)
                        ? SizedBox()
                        : brandController.categoryList != null
                            ? Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // showDialog(
                                      //     context: context,
                                      //     builder: (con) => Dialog(
                                      //         child: Container(
                                      //             height: 550,
                                      //             width: 600,
                                      //             child: CategoryPopUp(
                                      //               categoryController:
                                      //                   brandController,
                                      //             ))));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: Dimensions.PADDING_SIZE_SMALL),
                                      child: CircleAvatar(
                                        radius: 35,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        child: Text('view_all'.tr,
                                            style: TextStyle(
                                                fontSize: Dimensions
                                                    .PADDING_SIZE_DEFAULT,
                                                color: Theme.of(context)
                                                    .cardColor)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              )
                            : CategoryAllShimmer(
                                categoryController: brandController)
                  ],
                ),
              ],
            );
    });
  }
}

class CategoryShimmer extends StatelessWidget {
  final BrandController categoryController;
  CategoryShimmer({@required this.categoryController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        itemCount: 14,
        padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
            child: Shimmer(
              duration: Duration(seconds: 2),
              enabled: categoryController.categoryList == null,
              child: Column(children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_SMALL),
                  ),
                ),
                SizedBox(height: 5),
                Container(height: 10, width: 50, color: Colors.grey[300]),
              ]),
            ),
          );
        },
      ),
    );
  }
}

class CategoryAllShimmer extends StatelessWidget {
  final BrandController categoryController;
  CategoryAllShimmer({@required this.categoryController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Padding(
        padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
        child: Shimmer(
          duration: Duration(seconds: 2),
          enabled: categoryController.categoryList == null,
          child: Column(children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
              ),
            ),
            SizedBox(height: 5),
            Container(height: 10, width: 50, color: Colors.grey[300]),
          ]),
        ),
      ),
    );
  }
}

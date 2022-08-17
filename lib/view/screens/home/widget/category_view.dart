import 'package:medibott/controller/category_controller.dart';
import 'package:medibott/controller/splash_controller.dart';
import 'package:medibott/controller/theme_controller.dart';
import 'package:medibott/helper/responsive_helper.dart';
import 'package:medibott/helper/route_helper.dart';
import 'package:medibott/util/dimensions.dart';
import 'package:medibott/util/styles.dart';
import 'package:medibott/view/base/custom_image.dart';
import 'package:medibott/view/base/title_widget.dart';
import 'package:medibott/view/screens/home/widget/category_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    return GetBuilder<CategoryController>(builder: (categoryController) {
      return (categoryController.categoryList != null &&
              categoryController.categoryList.length == 0)
          ? SizedBox()
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TitleWidget(
                    title: 'categories'.tr,
                    onTap: () => Get.toNamed(RouteHelper.getCategoryRoute()),
                  ),
                ),
                Container(
                  // color: Colors.amberAccent,
                  padding: EdgeInsets.fromLTRB(4, 10, 10, 0),
                  height: 270,
                  child: categoryController.categoryList != null
                      ? GridView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 13.0,
                            mainAxisSpacing: 12.0,
                          ),
                          controller: _scrollController,
                          itemCount: categoryController.categoryList.length >= 6
                              ? 6
                              : categoryController.categoryList.length,
                          // categoryController.categoryList.length > 15
                          //     ? 15
                          //     : categoryController.categoryList.length,
                          padding: EdgeInsets.only(
                              left: Dimensions.PADDING_SIZE_SMALL,
                              top: Dimensions.PADDING_SIZE_SMALL,
                              bottom: Dimensions.PADDING_SIZE_SMALL),
                          // physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () =>
                                  Get.toNamed(RouteHelper.getCategoryItemRoute(
                                categoryController.categoryList[index].id,
                                categoryController.categoryList[index].name,
                              )),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.RADIUS_SMALL),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors
                                            .grey[Get.isDarkMode ? 800 : 200],
                                        blurRadius: 5,
                                        spreadRadius: 1)
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.RADIUS_SMALL),
                                        child: CustomImage(
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                          image:
                                              '${Get.find<SplashController>().configModel.baseUrls.categoryImageUrl}/${categoryController.categoryList[index].image}',
                                        ),
                                      ),
                                      SizedBox(
                                          height: Dimensions
                                              .PADDING_SIZE_EXTRA_SMALL),
                                      Text(
                                        categoryController
                                            .categoryList[index].name,
                                        textAlign: TextAlign.center,
                                        style: robotoMedium.copyWith(
                                            fontSize: Dimensions.fontSizeSmall),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ]),
                              ),
                            );
                          },
                        )
                      : CategoryShimmer(categoryController: categoryController),
                ),
                ResponsiveHelper.isMobile(context)
                    ? SizedBox()
                    : categoryController.categoryList != null
                        ? Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (con) => Dialog(
                                          child: Container(
                                              height: 550,
                                              width: 600,
                                              child: CategoryPopUp(
                                                categoryController:
                                                    categoryController,
                                              ))));
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
                                            fontSize:
                                                Dimensions.PADDING_SIZE_DEFAULT,
                                            color:
                                                Theme.of(context).cardColor)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          )
                        : CategoryAllShimmer(
                            categoryController: categoryController),
              ],
            );
    });
  }
}

class CategoryShimmer extends StatelessWidget {
  final CategoryController categoryController;
  CategoryShimmer({@required this.categoryController});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(right: 100),
      height: 270,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13.0,
          mainAxisSpacing: 12.0,
        ),
        itemCount: 6,
        // padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
        physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
            child: Shimmer(
              duration: Duration(seconds: 2),
              enabled: categoryController.categoryList == null,
              child: Column(children: [
                Container(
                  height: 110,
                  // width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius:
                        BorderRadius.circular(Dimensions.RADIUS_SMALL),
                  ),
                ),
                // SizedBox(height: 5),
              ]),
            ),
          );
        },
      ),
    );
  }
}

class CategoryAllShimmer extends StatelessWidget {
  final CategoryController categoryController;
  CategoryAllShimmer({@required this.categoryController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
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
                // color: Colors.grey[800],
                borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
              ),
            ),
            SizedBox(height: 5),
            Container(height: 10, width: 50, color: Colors.grey[400]),
          ]),
        ),
      ),
    );
  }
}

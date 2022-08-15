import 'package:medibott/controller/brand_controller.dart';
import 'package:medibott/controller/category_controller.dart';
import 'package:medibott/controller/splash_controller.dart';
import 'package:medibott/helper/responsive_helper.dart';
import 'package:medibott/helper/route_helper.dart';
import 'package:medibott/util/app_constants.dart';
import 'package:medibott/util/dimensions.dart';
import 'package:medibott/util/styles.dart';
import 'package:medibott/view/base/custom_app_bar.dart';
import 'package:medibott/view/base/custom_image.dart';
import 'package:medibott/view/base/footer_view.dart';
import 'package:medibott/view/base/menu_drawer.dart';
import 'package:medibott/view/base/no_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandAllScreen extends StatefulWidget {
  @override
  State<BrandAllScreen> createState() => _BrandAllScreenState();
}

class _BrandAllScreenState extends State<BrandAllScreen> {
  @override
  Widget build(BuildContext context) {
    // Get.find<BrandController>().categoryList;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(title: 'all_brands'.tr),
      endDrawer: MenuDrawer(),
      body: SafeArea(
          child: Scrollbar(
              child: SingleChildScrollView(
                  child: FooterView(
                      child: SizedBox(
        width: Dimensions.WEB_MAX_WIDTH,
        child: GetBuilder<BrandController>(builder: (brandController) {
          return brandController.categoryList != null
              ? brandController.categoryList.length > 0
                  ? GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: ResponsiveHelper.isDesktop(context)
                            ? 6
                            : ResponsiveHelper.isTab(context)
                                ? 4
                                : 3,
                        childAspectRatio: (1 / 1),
                        mainAxisSpacing: Dimensions.PADDING_SIZE_SMALL,
                        crossAxisSpacing: Dimensions.PADDING_SIZE_SMALL,
                      ),
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                      itemCount: brandController.categoryList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Get.toNamed(
                              RouteHelper.getBrandItemRoute(
                                  brandController.categoryList[index].id,
                                  brandController.categoryList[index].name,
                                  brandController.categoryList[index].image)),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.RADIUS_SMALL),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.grey[Get.isDarkMode ? 800 : 200],
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
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                      image: AppConstants.BRAND_IMAGE_URI +
                                          '/${brandController.categoryList[index].image}',
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  Text(
                                    brandController.categoryList[index].name,
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
                  : NoDataScreen(text: 'no_category_found'.tr)
              : Center(child: CircularProgressIndicator());
        }),
      ))))),
    );
  }
}

import 'package:medibott/controller/splash_controller.dart';
import 'package:medibott/data/model/response/order_model.dart';
import 'package:medibott/util/dimensions.dart';
import 'package:medibott/util/styles.dart';
import 'package:medibott/view/base/custom_image.dart';
import 'package:medibott/view/base/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DeliveryManWidget extends StatelessWidget {
  final DeliveryMan deliveryMan;
  DeliveryManWidget({@required this.deliveryMan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[Get.isDarkMode ? 700 : 300],
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('delivery_man'.tr,
            style: robotoRegular.copyWith(
                fontSize: Dimensions.fontSizeExtraSmall)),
        ListTile(
          leading: ClipOval(
            child: CustomImage(
              image:
                  '${Get.find<SplashController>().configModel.baseUrls.deliveryManImageUrl}/${deliveryMan.image}',
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            '${deliveryMan.fName} ${deliveryMan.lName}',
            style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
          ),
          subtitle: RatingBar(
              rating: deliveryMan.avgRating,
              size: 15,
              ratingCount: deliveryMan.ratingCount ?? 0),
          trailing: InkWell(
            onTap: () => launchUrlString('tel:${deliveryMan.phone}',
                mode: LaunchMode.externalApplication),
            child: Container(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).disabledColor.withOpacity(0.2)),
              child: Icon(Icons.call_outlined),
            ),
          ),
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixam_mart/helper/route_helper.dart';
import 'package:sixam_mart/view/new_screens/address/address_page.dart';
import 'package:sixam_mart/view/new_screens/cart/cart.dart';
import 'package:sixam_mart/view/new_screens/colors.dart';

class AppBarContent extends StatelessWidget {
  const AppBarContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///Head line with subtitle
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MEDIBOTT',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            // const Image(
            //     image: NetworkImage(
            //         'https://www.sookh.com/public/assets/logo/logo.png'),
            //     height: 15),
            // const Image(
            //   image: AssetImage('assets/image/logo.png'),
            //   height: 15),

            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const AddressPage()));
              },
              child: Wrap(
                  spacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    Text('Delivery to'),
                    Text(
                      'Choose Address',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Icon(Icons.expand_more),
                  ]),
            ),
          ],
        ),

        Wrap(
          spacing: 10,
          children: [
            InkWell(
              onTap: () {
                modalBottomSheetMenu(context);
                // Get.toNamed(RouteHelper.getSignInRoute(RouteHelper.main));
              },
              child: Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://i.pravatar.cc/100',
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const CartScreen()));
              },
              child: Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void modalBottomSheetMenu(context) {
    bool isSignin = true;
    bool isGetOtp = false;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return StatefulBuilder(builder: (context, state) {
            return Container(
                height: 350.0,
                color: Colors.transparent,
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // const Text(
                        //   "Sign in to Continue",
                        //   style: TextStyle(
                        //       color: AppColors.colorPrimary,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 18),
                        // ),
                        InkWell(
                          onTap: () {
                            state(() {
                              Navigator.pop(context);
                            });
                          },
                          child: const Icon(
                            Icons.close,
                            color: AppColors.colorPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    /// Sign in
                    Visibility(
                      visible: isSignin ?? false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: "+91 Enter Phone Number",
                              labelStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.colorPrimary,
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () {
                                state(() {
                                  isSignin = false;
                                  isGetOtp = true;
                                });
                              },
                              child: const Text("Continue")),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text("Have a referral code?",
                              style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.underline)),
                        ],
                      ),
                    ),

                    /// Get OTP code
                    Visibility(
                      visible: isGetOtp ?? false,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Expanded(
                                  child: Text(
                                "Enter the otp sent to 01951043844",
                                style: TextStyle(color: Colors.black54),
                              )),
                              Text(
                                "Edit",
                                style: TextStyle(
                                    color: AppColors.colorPrimary,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF464E54),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: const Text(
                                    "0:24",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Resend SMS",
                                style: TextStyle(color: AppColors.colorPrimary),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: "+88 Enter Phone Number",
                              labelStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.colorPrimary,
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () {
                                state(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: const Text("Get Otp Code")),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'By continuing you agree to our '),
                          TextSpan(
                            text: 'Terms of services,Privacy Policy',
                            style: TextStyle(color: AppColors.colorPrimary),
                          ),
                          TextSpan(text: '& '),
                          TextSpan(
                            text: 'Return and Refund Policy',
                            style: TextStyle(color: AppColors.colorPrimary),
                          ),
                        ],
                      ),
                    )
                  ],
                ));
          });
        });
  }
}

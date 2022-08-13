import 'package:flutter/material.dart';
import 'package:medibott/view/new_screens/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String dropdownValue = 'Qty 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            "Cart",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Items not Requiring Prescriptions (2)",
                              style: TextStyle(color: Colors.black54),
                            ),
                            Row(
                              children: [
                                Container(
                                    width: 60.0,
                                    height: 60.0,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "https://www.lifewire.com/thmb/O--Lj_qp0lLX2psEC_8QsL-Aeqo=/1500x1500/filters:no_upscale()/_hero_SQ_Dell-XPS-13-Two-in-One-Computer-1-c8f6c090145a4de69ca1c90f75659abe.jpg")))),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Laptop dell XPS 13",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Dell Laptop",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                        Text(
                                          "Rapid Test",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                        Text(
                                          "1 * 1's pack",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.delete,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "₹120",
                                      style: TextStyle(
                                          color: AppColors.colorPrimary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 70.0,
                                      height: 30,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: dropdownValue,
                                          icon:
                                              const Icon(Icons.arrow_drop_down),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: const TextStyle(
                                              color: Colors.black54),
                                          underline: Container(
                                            height: 1,
                                            color: Colors.black54,
                                          ),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                            });
                                          },
                                          items: <String>[
                                            'Qty 1',
                                            'Qty 2',
                                            'Qty 3',
                                            'Qty 4',
                                            'Qty 5',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              children: [
                                Container(
                                    width: 60.0,
                                    height: 60.0,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMzRcLzM0MzQ2LUNsdW5nZW5lLUNvdmlkLVJhcGlkLUFudGlnZW4tVGVzdC1LaXQtU0FSUy1Db1YtMi0xMzJkLnBuZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MTAwMCwiaGVpZ2h0IjoxMDAwLCJmaXQiOiJvdXRzaWRlIn0sIm92ZXJsYXlXaXRoIjp7ImJ1Y2tldCI6ImFyb2dnYSIsImtleSI6Im1pc2NcL3dtLnBuZyIsImFscGhhIjo5MH19fQ==")))),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Clungene Covid-19",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "SARS-CoV-2",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                        Text(
                                          "Rapid Test",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                        Text(
                                          "1 * 1's pack",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.delete,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "₹120",
                                      style: TextStyle(
                                          color: AppColors.colorPrimary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 70.0,
                                      height: 30,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: dropdownValue,
                                          icon:
                                              const Icon(Icons.arrow_drop_down),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: const TextStyle(
                                              color: Colors.black54),
                                          underline: Container(
                                            height: 1,
                                            color: Colors.black54,
                                          ),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                            });
                                          },
                                          items: <String>[
                                            'Qty 1',
                                            'Qty 2',
                                            'Qty 3',
                                            'Qty 4',
                                            'Qty 5',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  "https://cdn6.arogga.com/img/address.png",
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.red),
                                  child: const Text(
                                    "Home Town",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Faysal Chowdhury",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12),
                                  ),
                                  Text("+8801777777777",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12)),
                                  Text(
                                      "you Please provide, Bhawal Gazipur, Gazipur,Dhaka",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12))
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 80,
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (_) => const AddressPage()));
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.colorGreenLight),
                                    textStyle: MaterialStateProperty.all(
                                        const TextStyle(fontSize: 30))),
                                child: const Text("Change",
                                    style: TextStyle(
                                        color: AppColors.colorPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Have coupon code?",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Container(
                              //   color: AppColors.colorGreenLight,
                              //   child: DottedBorder(
                              //     color: AppColors.colorPrimary,
                              //     borderType: BorderType.RRect,
                              //     radius: const Radius.circular(8),
                              //     padding: const EdgeInsets.symmetric(
                              //         horizontal: 12, vertical: 10),
                              //     strokeWidth: 1,
                              //     child: Row(
                              //       children: [
                              //         Row(
                              //           children: [
                              //             Image.network(
                              //               "https://cdn6.arogga.com/img/taka.png",
                              //               width: 22,
                              //               height: 22,
                              //             ),
                              //             const SizedBox(
                              //               width: 10,
                              //             ),
                              //             RichText(
                              //                 text: const TextSpan(
                              //                     style:
                              //                         TextStyle(fontSize: 14),
                              //                     children: <TextSpan>[
                              //                   TextSpan(
                              //                       text: "You are saving ",
                              //                       style: TextStyle(
                              //                           color: AppColors
                              //                               .colorPrimary,
                              //                           fontSize: 12)),
                              //                   TextSpan(
                              //                       text: "₹120",
                              //                       style: TextStyle(
                              //                           color: AppColors
                              //                               .colorPrimary,
                              //                           fontWeight:
                              //                               FontWeight.bold,
                              //                           fontSize: 12)),
                              //                   TextSpan(
                              //                       text: " in this order",
                              //                       style: TextStyle(
                              //                           color: AppColors
                              //                               .colorPrimary,
                              //                           fontSize: 12)),
                              //                 ])),
                              //           ],
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      "Subtotal",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12),
                                    ),
                                  ),
                                  Text(
                                    " ₹1120",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      "Discount applied",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12),
                                    ),
                                  ),
                                  Text(
                                    "-₹400",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      "Delivery Charge(Outside Dhaka)",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12),
                                    ),
                                  ),
                                  Text(
                                    " ₹42",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "To get free delivery order more than ₹500",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  color: Colors.white,
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (_) => const CheckoutScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 18),
                    child: Container(
                      height: 45,
                      decoration: const BoxDecoration(
                          color: AppColors.colorPrimary,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "₹792",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                Text("View Cart",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12))
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            "PROCEED TO CHECKOUT",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ));
  }
}

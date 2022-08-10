import 'package:flutter/material.dart';
import 'package:sixam_mart/view/new_screens/bulk_data.dart';
import 'package:sixam_mart/view/new_screens/cart/cart.dart';
import 'package:sixam_mart/view/new_screens/colors.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                    "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMzFcLzMxMzMzLVN1cmdpY2FsLWhlYWQtY2FwLU1lZGljYWwtTW9wLUNsaXAtSGVhZC1Db3Zlci1DYXBzLVNreS1CbHVlLTNidHIuanBlZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MTAwMCwiaGVpZ2h0IjoxMDAwLCJmaXQiOiJvdXRzaWRlIn0sIm92ZXJsYXlXaXRoIjp7ImJ1Y2tldCI6ImFyb2dnYSIsImtleSI6Im1pc2NcL3dtLnBuZyIsImFscGhhIjo5MH19fQ=="),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    // "সারা বাংলাদেশ থেকে অর্ডার করা যাবে।",
                    "Worldwide Delivery",
                    style:
                        TextStyle(fontSize: 12, color: AppColors.colorPrimary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Surgical Head Cap Medical Mop Clip Head Cover/Caps-Sky Blue",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Surgical Cap",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: AppColors.colorGreenLight,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      "https://cdn6.arogga.com/img/recently_bought.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "1945 people recently viewed this",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 0),
                                child: RichText(
                                    text: const TextSpan(
                                        style: TextStyle(fontSize: 14),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: "Price  ",
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500)),
                                      TextSpan(
                                          text: "₹8.00",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                    ])),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: RichText(
                                        text: const TextSpan(
                                            style: TextStyle(fontSize: 14),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: "MRP  ",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 12)),
                                          TextSpan(
                                              text: "₹10.00",
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.black87,
                                                  fontSize: 12)),
                                        ])),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.redAccent,
                                      ),
                                      child: const Text(
                                        "20% OFF",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: AppColors.colorPrimary)),
                                      child: Row(
                                        children: const [
                                          Text(
                                            "1 * 1's Pack",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.colorPrimary),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down_sharp,
                                            color: AppColors.colorPrimary,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const CartScreen()));
                                      },
                                      style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          )),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  AppColors.colorPrimary),
                                          padding: MaterialStateProperty.all(
                                              const EdgeInsets.symmetric(
                                                  vertical: 10,
                                                  horizontal: 20)),
                                          textStyle: MaterialStateProperty.all(
                                              const TextStyle(fontSize: 30))),
                                      child: const Text(
                                        'Add To Cart',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Additional offers",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text("Show less",
                              style: TextStyle(
                                  color: AppColors.colorPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.sell,
                            color: AppColors.colorPrimary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RichText(
                              text: const TextSpan(
                                  style: TextStyle(fontSize: 14),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: "Cashback ₹100 ",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                TextSpan(
                                    text: "for purchasing above ₹5000+",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12)),
                              ])),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.sell,
                            color: AppColors.colorPrimary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RichText(
                              text: const TextSpan(
                                  style: TextStyle(fontSize: 14),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: "Cashback ₹80 ",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                TextSpan(
                                    text: "for purchasing above ₹4000+",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12)),
                              ])),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.sell,
                            color: AppColors.colorPrimary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RichText(
                              text: const TextSpan(
                                  style: TextStyle(fontSize: 14),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: "Cashback ₹60 ",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                TextSpan(
                                    text: "for purchasing above ₹3000+",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12)),
                              ])),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.sell,
                            color: AppColors.colorPrimary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RichText(
                              text: const TextSpan(
                                  style: TextStyle(fontSize: 14),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: "Cashback ₹20 ",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                TextSpan(
                                    text: "for purchasing above ₹1000+",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 12)),
                              ])),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                        "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJvcHRpb25cL2F0dGFjaGVkRmlsZXNXZWItXC90cndvcXQucG5nIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjoxNDA1LCJoZWlnaHQiOjQ1MCwiZml0Ijoib3V0c2lkZSJ9fX0="),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: const [
                      Icon(Icons.library_books_outlined),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.colorPrimary),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    BulkData.description,
                    style: const TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Similar Product",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorPrimary),
                  ),
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.5),
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                  ),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.network(
                              "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMzNcLzMzMTc3LVN1cmdpY2FsLU1hc2stMy1MYXllcnMtd2l0aC1Ob3NlLVBpbi01MHBjcy1Cb3gtRHljcm9sLXBvMHUuanBlZyIsImVkaXRzIjp7InJlc2l6ZSI6eyJ3aWR0aCI6MTAwMCwiaGVpZ2h0IjoxMDAwLCJmaXQiOiJvdXRzaWRlIn0sIm92ZXJsYXlXaXRoIjp7ImJ1Y2tldCI6ImFyb2dnYSIsImtleSI6Im1pc2NcL3dtLnBuZyIsImFscGhhIjo5MH19fQ==",
                              height: 160,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Surgical Mask 3",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: RichText(
                                      text: const TextSpan(
                                          style: TextStyle(fontSize: 14),
                                          children: <TextSpan>[
                                        TextSpan(
                                            text: "MRP  ",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 10)),
                                        TextSpan(
                                            text: "₹10.00",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.black87,
                                                fontSize: 10)),
                                      ])),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.redAccent,
                                    ),
                                    child: const Text(
                                      "20% OFF",
                                      style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "₹200",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning,
                        color: Colors.redAccent[200],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Disclaimer",
                        style: TextStyle(
                            color: Colors.redAccent[200],
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    BulkData.disclaimer,
                    style: const TextStyle(color: Colors.black54, fontSize: 10),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          color: Colors.white24, shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_back_outlined)),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const CartScreen()));
                  },
                  child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                          color: Colors.white24, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 22,
                      )),
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const CartScreen()));
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
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "₹8",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Text("1 ITEM",
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
                          "VIEW CART",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
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
      ),
    );
  }
}

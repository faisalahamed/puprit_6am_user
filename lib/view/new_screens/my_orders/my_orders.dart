import 'package:flutter/material.dart';
import 'package:medibott/view/new_screens/bulk_data.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  int value = 0;

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
          "My orders",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Wrap(
                spacing: 6,
                children: List<Widget>.generate(
                  orderList.length,
                  (int index) {
                    return ChoiceChip(
                      elevation: 0,
                      label: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          orderList[index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      selected: value == index,
                      backgroundColor: Colors.white,
                      selectedColor: const Color(0xFFC2F9EC),
                      labelStyle: TextStyle(
                          color: value == index
                              ? const Color(0xFF49A195)
                              : Colors.black54),
                      onSelected: (bool selected) {
                        setState(() {
                          value = index;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Amount Payable",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        Spacer(),
                        Text(
                          "₹779",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    const Text(
                      "You will see online payment option once your order is packed",
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                            child: Text(
                          "star complex Taltola,Dhaka City,bangladesh"
                          "",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.network(
                          "https://cdn6.arogga.com/img/address.png",
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: const [
                        Text(
                          "Order ID",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          "#22276",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Date",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          "14 Jul 2021,20:40",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Status",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Text(
                              "Cancelled",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Amount Payable",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        Spacer(),
                        Text(
                          "₹738",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.redAccent)),
                        child: const Text(
                          "Accidental Order.",
                          style: TextStyle(color: Colors.black54),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                            child: Text(
                          "star complex Taltola,Dhaka City,bangladesh"
                          "",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.network(
                          "https://cdn6.arogga.com/img/address.png",
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: const [
                        Text(
                          "Order ID",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          "#22276",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Date",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          "14 Jul 2021,20:40",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Status",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Text(
                              "Delivered",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Amount Payable",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        Spacer(),
                        Text(
                          "₹738",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 350.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: const Center(
                  child: Text("This is a modal sheet"),
                )),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:medibott/view/new_screens/colors.dart';

class EditAddAddressPage extends StatefulWidget {
  const EditAddAddressPage({Key key}) : super(key: key);

  @override
  State<EditAddAddressPage> createState() => _EditAddAddressPageState();
}

class _EditAddAddressPageState extends State<EditAddAddressPage> {
  String dropdownValue = 'Select region';
  String dropdownValue1 = 'Select district';
  String dropdownValue2 = 'Select area';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Add Shipping address',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1.0,
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 8.0,
          ),
          Icon(Icons.shopping_cart),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AddShippingItem(
              title: 'Full Name',
              onChanged: (val) {
                print(val);
              },
            ),
            AddShippingItem(
              title: 'Mobile',
              onChanged: (val) {
                print(val);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    "Region",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0,
                        color: AppColors.colorPrimary),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black54),
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
                            'Select region',
                            'Dhaka',
                            'Barishal',
                            'Chattogram',
                            'Khulna'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    "City",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0,
                        color: AppColors.colorPrimary),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue1,
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black54),
                          underline: Container(
                            height: 1,
                            color: Colors.black54,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue1 = newValue;
                            });
                          },
                          items: <String>[
                            'Select district',
                            'Dhaka City',
                            'Faridpur',
                            'Jamalpur',
                            'Mymensingh'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    "Area",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0,
                        color: AppColors.colorPrimary),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue2,
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black54),
                          underline: Container(
                            height: 1,
                            color: Colors.black54,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue2 = newValue;
                            });
                          },
                          items: <String>[
                            'Select area',
                            'Dhaka',
                            'Barishal',
                            'Chattogram',
                            'Khulna'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    )),
              ],
            ),
            AddShippingItem(
              title: 'Address',
              onChanged: (val) {
                print(val);
              },
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Address Type',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18.0,
                    color: AppColors.colorPrimary),
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: OutlinedButton(
                        onPressed: null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: const [
                              Icon(Icons.home,
                                  color: AppColors.colorPrimary, size: 18.0),
                              SizedBox(width: 8.0),
                              Text(
                                'Home',
                                style: TextStyle(
                                    color: AppColors.colorPrimary,
                                    fontSize: 11.0),
                              )
                            ],
                          ),
                        )),
                  ),
                  OutlinedButton(
                      onPressed: null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: const [
                            Icon(Icons.home_repair_service,
                                color: AppColors.colorPrimary, size: 18.0),
                            SizedBox(width: 8.0),
                            Text(
                              'office',
                              style: TextStyle(
                                  color: AppColors.colorPrimary,
                                  fontSize: 11.0),
                            )
                          ],
                        ),
                      )),
                  OutlinedButton(
                      onPressed: null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.home_filled,
                              color: AppColors.colorPrimary,
                              size: 18.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Home town',
                              style: TextStyle(
                                  color: AppColors.colorPrimary,
                                  fontSize: 11.0),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddShippingItem extends StatelessWidget {
  final String title;
  final Function(String) onChanged;

  const AddShippingItem(
      {Key key, @required this.title, @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18.0,
                color: AppColors.colorPrimary),
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                TextFormField(
                  cursorColor: Colors.black,
                  onChanged: (val) => onChanged.call(val),
                  decoration: const InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

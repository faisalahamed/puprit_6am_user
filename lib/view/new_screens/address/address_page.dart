import 'package:flutter/material.dart';
import 'package:sixam_mart/view/new_screens/colors.dart';
import 'content/custom_divider.dart';
import 'content/custom_dotted_button.dart';
import 'edit_add_address.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Addresses',
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
        margin: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomDottedButton(
              icon: Icons.add,
              title: 'Add New Address',
              color: AppColors.colorPrimary,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const EditAddAddressPage()));
              },
            ),
            const CustomDivider(),
            const AddressCardItem(
              addressType: 'Hometown',
              addressTypeColor: Colors.red,
              isDefault: true,
            ),
            const CustomDivider(),
            const AddressCardItem(
                addressType: 'Home', addressTypeColor: Colors.blue),
            const CustomDivider(),
          ],
        ),
      ),
    );
  }
}

class AddressCardItem extends StatelessWidget {
  final bool isDefault;
  final String addressType;
  final Color addressTypeColor;

  const AddressCardItem(
      {Key key,
      this.isDefault = false,
      @required this.addressType,
      @required this.addressTypeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.0,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.edit_location_sharp,
                  color: AppColors.colorPrimary,
                ),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  margin: const EdgeInsets.only(top: 4.0),
                  decoration: BoxDecoration(
                    color: addressTypeColor,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: Text(
                    addressType,
                    style: const TextStyle(color: Colors.white, fontSize: 9.0),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Mamun Hossain',
                style: TextStyle(fontSize: 13.0, color: Colors.black54),
              ),
              const Text(
                '+8801903273865',
                style: TextStyle(fontSize: 13.0, color: Colors.black54),
              ),
              const Text(
                'Road 13/B, Banani, Dhaka city, Dhaka',
                style: TextStyle(fontSize: 13.0, color: Colors.black54),
              ),
              Visibility(
                visible: isDefault,
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  margin: const EdgeInsets.only(top: 4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.colorPrimary),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: const Text('Default Shipping Address',
                      style: TextStyle(fontSize: 13.0, color: Colors.black54)),
                ),
              )
            ],
          )),
          SizedBox(
            width: 70.0,
            child: TextButton(
              onPressed: () {},
              child: const Text('EDIT',
                  style: TextStyle(
                      fontSize: 13.0,
                      color: AppColors.colorPrimary,
                      fontWeight: FontWeight.normal)),
            ),
          )
        ],
      ),
    );
  }
}

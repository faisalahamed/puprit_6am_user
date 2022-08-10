import 'package:flutter/material.dart';
import 'package:sixam_mart/view/new_screens/colors.dart';
import '../address/edit_add_address.dart';


class RequestMedicinePage extends StatelessWidget {
  const RequestMedicinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Request medicine',
          style: TextStyle(
              color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AddShippingItem(
              title: 'Medicine Name',
              onChanged: (val) {
                print(val);
              },
            ),
            const SizedBox(height: 8.0,),
            AddShippingItem(
              title: 'Strength',
              onChanged: (val) {
                print(val);
              },
            ),
            const SizedBox(height: 8.0,),
            AddShippingItem(
              title: 'Medicine Form',
              onChanged: (val) {
                print(val);
              },
            ),
            const SizedBox(height: 8.0,),
            AddShippingItem(
              title: 'Company',
              onChanged: (val) {
                print(val);
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'If you want to suggest multiple medicines, please email Excel sheet to mh72156@gmail.com',
              style: TextStyle(color: Colors.grey, fontSize: 13.0),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                onPressed: null,
                style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.colorPrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0))),
                child: const Text('SUGGEST',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Account',
          style: TextStyle(
              color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox.square(
              dimension: 100.0,
              child: Stack(
                children: const [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        'https://bestprofilepictures.com/wp-content/uploads/2021/06/Anonymous-Profile-Pic-1.jpg'),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: CircleAvatar(
                      radius: 16.0,
                      child: Icon(Icons.edit, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Divider(
              color: Colors.grey,
            ),
            const AccountItem(
              title: 'Name',
              value: 'Mamun Hossain',
            ),
            const AccountItem(
              title: 'Phone Number',
              value: '+88019000000',
            ),
            const AccountItem(
              title: 'E-mail',
              value: 'test@gmail.com',
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(2.0, 2.0),
                        blurRadius: 4.0,
                        spreadRadius: 2.0)
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(8.0))),
              child: const ListTile(
                title: Text(
                  'Cash (Usable)',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey),
                ),
                trailing: Text(
                  ' ₹0',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Sign Out',
              style: TextStyle(fontSize: 22.0),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountItem extends StatelessWidget {
  final String title;
  final String value;

  const AccountItem({Key key, @required this.title, @required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Text(title, style: const TextStyle(color: Colors.black54)),
        const SizedBox(
          height: 8.0,
        ),
        Text(value, style: const TextStyle(color: Colors.black87)),
      ],
    );
  }
}

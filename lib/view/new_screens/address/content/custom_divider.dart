import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {

  final Color color;

  const CustomDivider({Key key,this.color = Colors.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4.0,),
        Divider(color: color,)
      ],
    );
  }
}

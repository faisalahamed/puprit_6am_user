import 'package:flutter/material.dart';
import 'package:medibott/view/new_screens/colors.dart';

class CustomDottedButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CustomDottedButton(
      {Key key,
      this.height = 55.0,
      this.width = 200.0,
      this.color = AppColors.colorPrimary,
      @required this.title,
      @required this.icon,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Container(
          color: color.withOpacity(0.1),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Row(
            children: [
              const Icon(Icons.add, color: AppColors.colorPrimary),
              const SizedBox(width: 8.0),
              Text(
                title,
                style: const TextStyle(color: AppColors.colorPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

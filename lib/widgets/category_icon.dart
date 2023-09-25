import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final dynamic color;
  final IconData iconData;

  const CategoryIcon({super.key, required this.color, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}

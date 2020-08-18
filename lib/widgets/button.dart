import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;

  const Button(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFF39CEFD)),
      child: Text(text, style: TextStyle(color: AppColors.white)),
    );
  }
}

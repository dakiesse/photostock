import 'package:flutter/material.dart';
import '../res/res.dart';

class PhotoDescription extends StatelessWidget {
  final String text;

  const PhotoDescription(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: AppStyles.h3.copyWith(color: AppColors.black),
    );
  }
}

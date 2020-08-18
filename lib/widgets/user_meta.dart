import 'package:flutter/material.dart';
import './user_avatar.dart';
import '../res/res.dart';

class UserMeta extends StatelessWidget {
  final String name;
  final String userName;
  final String photoLink;

  const UserMeta({Key key, this.name, this.userName, this.photoLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        UserAvatar(url: photoLink),
        SizedBox(width: 6),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: AppStyles.h2Black),
            Text('@$userName', style: AppStyles.h5Black.copyWith(color: AppColors.manatee)),
          ],
        )
      ],
    );
  }
}

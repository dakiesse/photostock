import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/photo.dart';

class FullScreenImage extends StatefulWidget {
  final String name;
  final String userName;
  final String photo;
  final String altDescription;

  FullScreenImage({
    Key key,
    this.name = '',
    this.userName = '',
    this.photo = '',
    this.altDescription = '',
  }) : super(key: key);

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Photo',
          style: TextStyle(color: AppColors.black),
        ),
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Photo(photoLink: widget.photo),
            SizedBox(height: 10),
            Text(
              widget.altDescription,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.h3.copyWith(color: AppColors.black),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                UserAvatar(url: 'https://secure.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50'),
                SizedBox(width: 6),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name, style: AppStyles.h2Black),
                    Text('@${widget.userName}', style: AppStyles.h5Black.copyWith(color: AppColors.manatee)),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LikeButton(likeCount: 1, isLiked: true),
                Row(
                  children: [
                    Button('Save', onTap: () {}),
                    SizedBox(width: 6),
                    Button('Visit', onTap: () {}),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final Function onTap;

  const Button(this.text, {Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFF39CEFD)),
        child: Text(text, style: TextStyle(color: AppColors.white)),
      ),
      onTap: onTap,
    );
  }
}

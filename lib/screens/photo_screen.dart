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
          onPressed: null,
        ),
      ),
      body: Wider(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Photo(photoLink: widget.photo),
            SizedBox(height: 10),
            PhotoDescription(widget.altDescription),
            SizedBox(height: 10),
            UserMeta(
              name: widget.name,
              userName: widget.userName,
              photoLink: 'https://secure.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LikeButton(likeCount: 1, isLiked: true),
                Row(
                  children: [
                    Button('Save'),
                    SizedBox(width: 6),
                    Button('Visit'),
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

import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/photo.dart';

class FullScreenImage extends StatefulWidget {
  final String name;
  final String userName;
  final String userPhoto;
  final String altDescription;
  final String photo;
  final String heroTag;

  FullScreenImage({
    Key key,
    this.name = '',
    this.userName = '',
    this.userPhoto = '',
    this.altDescription = '',
    @required this.photo,
    @required this.heroTag,
  }) : super(key: key);

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // shadowColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Photo',
          style: TextStyle(color: AppColors.black),
        ),
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: widget.heroTag,
              child: Photo(photoLink: widget.photo),
            ),
            SizedBox(height: 10),
            Text(
              widget.altDescription,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.h3.copyWith(color: AppColors.black),
            ),
            SizedBox(height: 10),
            StaggeredMeta(widget: widget, controller: _controller),
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

class StaggeredMeta extends StatelessWidget {
  final FullScreenImage widget;
  final AnimationController controller;
  final Animation<double> avatarOpacity;
  final Animation<double> usernameOpacity;

  StaggeredMeta({Key key, this.widget, this.controller})
      : avatarOpacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.5,
              curve: Curves.ease,
            ),
          ),
        ),
        usernameOpacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.5,
              1.0,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Row(
          children: <Widget>[
            Opacity(
              opacity: avatarOpacity.value,
              child: UserAvatar(url: widget.userPhoto),
            ),
            SizedBox(width: 6),
            Opacity(
              opacity: usernameOpacity.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name, style: AppStyles.h2Black),
                  Text('@${widget.userName}', style: AppStyles.h5Black.copyWith(color: AppColors.manatee)),
                ],
              ),
            )
          ],
        );
      },
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

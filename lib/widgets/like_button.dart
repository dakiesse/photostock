import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool isLiked;
  final int likeCount;

  LikeButton({Key key, @required this.likeCount, @required this.isLiked}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked;
  int likeCount;

  @override
  void initState() {
    super.initState();

    isLiked = widget.isLiked;
    likeCount = widget.likeCount;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // behavior: ,
      onTap: _handlerTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Icon(isLiked ? AppIcons.like_fill : AppIcons.like),
              SizedBox(width: 4),
              SizedBox(
                width: 10,
                child: Center(
                  child: Text(likeCount.toString()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handlerTap() {
    setState(() {
      isLiked = !isLiked;

      if (isLiked)
        likeCount++;
      else
        likeCount--;
    });
  }
}

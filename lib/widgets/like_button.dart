import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  bool active;
  int likeCount;

  LikeButton(this.likeCount, this.active, {Key key}) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool active;
  int likeCount;

  @override
  void initState() {
    super.initState();

    active = widget.active;
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
              Icon(active ? AppIcons.like_fill : AppIcons.like),
              SizedBox(width: 4),
              Text(likeCount.toString()),
            ],
          ),
        ),
      ),
    );
  }

  void _handlerTap() {
    setState(() {
      active = !active;

      if (active)
        likeCount++;
      else
        likeCount--;
    });
  }
}

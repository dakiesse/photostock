import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              _buildItem(),
              Divider(
                thickness: 2,
                color: AppColors.mercury,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Photo(
            photoLink:
                'https://bd.gaadicdn.com/processedimages/ktm/duke-250/640X309/duke-2505e5dd6e90822d.jpg?tr=h-140'),
        _buildMeta(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: PhotoDescription('This is Flutter dash. I love him.'),
        )
      ],
    );
  }

  Widget _buildMeta() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          UserMeta(
            name: 'Dany',
            userName: 'Dany',
            photoLink: 'https://secure.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
          ),
          LikeButton(likeCount: 2, isLiked: true),
        ],
      ),
    );
  }
}

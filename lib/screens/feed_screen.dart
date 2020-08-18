import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  Feed({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
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
        Photo(url: 'https://bd.gaadicdn.com/processedimages/ktm/duke-250/640X309/duke-2505e5dd6e90822d.jpg?tr=h-140'),
        _buildMeta(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            'This is Flutter dash. I love him.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.h3.copyWith(color: AppColors.black),
          ),
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
          Row(
            children: <Widget>[
              UserAvatar(url: 'https://secure.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50'),
              SizedBox(width: 6),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dany', style: AppStyles.h2Black),
                  Text('@Dany', style: AppStyles.h5Black.copyWith(color: AppColors.manatee)),
                ],
              )
            ],
          ),
          LikeButton(2, true),
        ],
      ),
    );
  }
}

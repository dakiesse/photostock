import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/material.dart';

const String kFlutterDash =
    'https://bd.gaadicdn.com/processedimages/ktm/duke-250/640X309/duke-2505e5dd6e90822d.jpg?tr=h-140';

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
              _buildItem(index),
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

  Widget _buildItem(int index) {
    String heroTag = 'heroTag' + index.toString();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: heroTag,
              child: Photo(photoLink: kFlutterDash),
            ),
            _buildMeta(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'This is Flutter dash. I love him.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.h3.copyWith(color: AppColors.black),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext builder) => FullScreenImage(
                name: 'Dany',
                userName: 'Danysa as das das',
                altDescription: 'Lorem lorem em lorem ',
                userPhoto: 'https://skill-branch.ru/img/speakers/Adechenko.jpg',
                photo: kFlutterDash,
                heroTag: heroTag,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMeta() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              UserAvatar(url: 'https://secure.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50'),
              SizedBox(width: 6),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dany', style: AppStyles.h2Black),
                  Text('@Dany', style: AppStyles.h5Black.copyWith(color: AppColors.manatee)),
                ],
              )
            ],
          ),
          LikeButton(likeCount: 2, isLiked: true),
        ],
      ),
    );
  }
}

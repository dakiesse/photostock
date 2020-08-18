import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:flutter/material.dart';
import 'package:FlutterGalleryApp/screens/feed_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FullScreenImage(
        name: 'Dany',
        userName: 'Danysa as das das',
        altDescription: 'Lorem lorem em lorem ',
        photo:
            'https://images.reverb.com/image/upload/s--nZqXbwfo--/f_auto,t_supersize/v1553393429/f41zqwml49difis3yvfp.jpg',
      ),
    );
  }
}

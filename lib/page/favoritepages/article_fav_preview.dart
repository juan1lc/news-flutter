import 'dart:ui';

import 'package:flutter/material.dart';

import '../../util/color.dart';

class ArticleFavPreview extends StatelessWidget {
  ArticleFavPreview({Key? key,
    required this.photo,
    required this.username,
    required this.content,
    required this.img,
    required this.title
  }) : super(key: key);

  String photo, username, content, img, title;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          // height: 300,
            padding: const EdgeInsets.only(left: 20,right: 20, top: 10),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8)
            ),
            child: Column(
                children: <Widget> [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children : <Widget> [
                        Row(
                          children: <Widget> [
                            CircleAvatar(backgroundImage: AssetImage(photo), radius: 25,),
                            SizedBox(width: 20,),
                            Text(username),
                          ],
                        ),
                        SizedBox(height: 5,),

                        Text(
                          "发布了文章 《" + title +" 》",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        SizedBox(height: 4,),

                        Container(
                          width: MediaQuery.of(context).size.width-40,
                          height: 180,
                          child: Stack(

                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width-40,
                                height: 180,
                                padding: EdgeInsets.only(left: 2, right: 2),
                                child: Image.asset(img, fit: BoxFit.cover),
                              ),
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                                child: new Container(
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width-40,
                                  height: 180,
                                padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            username, style:
                                          TextStyle(color: Colors.white),
                                          ),
                                          Spacer(),
                                          Icon(Icons.lightbulb, color: Colors.white,),
                                          Text("发布文章", style: TextStyle(color: Colors.white)),
                                        ],
                                      ),
                                      Spacer(),
                                      Text(
                                        title, style:
                                      TextStyle(color: Colors.white, fontSize: 24),
                                      ),
                                    ],
                                  ),
                              )

                            ],

                          ),
                        ),

                        SizedBox(height: 4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconContainer(Icons.repeat, "11", '/'),
                            IconContainer(Icons.comment, "113", '/'),
                            IconContainer(Icons.thumb_up, "1140", "/")
                          ],
                        )
                      ])
                ])
        ));
  }
}

class IconContainer extends StatelessWidget {
  final IconData iconImage;
  final String iconName;
  final String route;
  IconContainer(this.iconImage, this.iconName, this.route, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  this.iconImage,
                  size: 25,
                  color: Colors.grey,
                ),
                onPressed: () {}
            ),
            Text(this.iconName,
                style: TextStyle(fontSize: 13, color: Colors.grey))
          ],
        ));
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/page/homepages/posts/banner_card.dart';
import 'package:news_app/page/homepages/tag/tag_page.dart';

class TagBanner extends StatelessWidget {
  const TagBanner({Key? key, this.userid}) : super(key: key);

  final String? userid;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: <Widget>[
          BannerCard(
              title: '考研分享',
              description: '1.4万讨论量',
              image: 'assets/images/banner0.jpg',
              onPress: () { Navigator.push(context, MaterialPageRoute(
                  builder:(context) => TagPage(
                    title: "考研分享", desc: "虽千万人，吾往矣",
                    img: 'assets/images/banner0.jpg', userid: userid,)));
              }),
          BannerCard(
              title: '学习打卡',
              description: '1.4万播放量',
              image: 'assets/images/banner1.jpg',
              onPress: () {
                Navigator.push(context, MaterialPageRoute(
                    builder:(context) => TagPage(
                      title: "学习打卡", desc: "明天的你会感谢今天的自己",
                      img: 'assets/images/banner1.jpg', userid: userid,)));
              }),
          BannerCard(
              title: '雅思经验分享',
              description: '1.4万播放量',
              image: 'assets/images/banner2.jpg',
              onPress: () {
                Navigator.push(context, MaterialPageRoute(
                    builder:(context) => TagPage(
                      title: "雅思经验分享", desc: "一次过！！！！！",
                      img: 'assets/images/banner2.jpg', userid: userid,)));
              })
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:news_app/page/homepages/posts/banner_card.dart';

class TagBanner extends StatelessWidget {
  const TagBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: <Widget>[
          BannerCard(
              title: 'hello',
              description: '1.4万播放量',
              image: 'assets/images/banner0.jpg',
              onPress: () { Navigator.pushNamed(context, '/'); }),
          BannerCard(
              title: '嘻哈',
              description: '1.4万播放量',
              image: 'assets/images/banner1.jpg',
              onPress: () {}),
          BannerCard(
              title: '嘻哈',
              description: '1.4万播放量',
              image: 'assets/images/banner2.jpg',
              onPress: () {})
        ],
      ),
    );
  }
}

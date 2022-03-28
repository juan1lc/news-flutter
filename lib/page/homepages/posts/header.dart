import 'package:flutter/cupertino.dart';
import 'package:news_app/page/homepages/posts/banner_card.dart';
import 'package:news_app/page/homepages/posts/tag_banner.dart';

import 'notification_area.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this. avatar,
    required this.username, required this.isLogin})
      : super(key: key);

  final String username, avatar;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 310,
      child: Stack(children: <Widget>[
        NotificationHead(username: username, avatar: avatar, isLogin: isLogin,),
        Column(
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            TagBanner()
          ],
        )
      ]),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:news_app/page/homepages/posts/banner_card.dart';
import 'package:news_app/page/homepages/posts/tag_banner.dart';

import 'notification_area.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 310,
      child: Stack(children: <Widget>[
        NotificationHead(),
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


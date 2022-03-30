import 'package:flutter/material.dart';
import 'package:news_app/page/homepages/posts/post_card.dart';
import 'package:news_app/page/homepages/posts/user_banner.dart';
import 'package:news_app/widget/Banner.dart';
import 'package:provider/provider.dart';

import '../../../models/user.dart';
import '../../../provider/user_info_provider.dart';
import '../../../util/color.dart';
import 'header.dart';

class DiscussPage extends StatefulWidget{
  const DiscussPage({Key? key}) : super(key: key);

  @override
  _DiscussPage createState() => _DiscussPage();
}

class _DiscussPage extends State<DiscussPage>{
  User? userInfo;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInfoProvider>(
      builder: (context, loginProvider, child){
        bool isLogin = loginProvider.isLogin;

        if(isLogin) userInfo = loginProvider.loginUser;
        return !isLogin?
        Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Header(avatar: 'assets/images/defaultAvatar.png',
                    username: '点击登录', isLogin: isLogin,),
                  const UserBanner(title: "用 户 推 荐"),

                  // PostCard(
                  //     photo: 'assets/images/avatar3.jpg',
                  //     username: "刘宇",
                  //     content: "武汉两名参与新型肺炎救治医生被患者家属打伤防护服被撕扯 警方已介入,"
                  //
                  // )

                ],
              ),
            )
        ):Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Header(avatar: userInfo!.photo!,
                    username: userInfo!.username, isLogin: isLogin,),
                  UserBanner(title: "用 户 推 荐"),

                  // PostCard(
                  //     photo: 'assets/images/avatar3.jpg',
                  //     username: "刘宇",
                  //     content: "武汉两名参与新型肺炎救治医生被患者家属打伤防护服被撕扯 谨防已介入,"
                  //
                  // )

                ],
              ),
            )
        );
      },
    );
  }

}
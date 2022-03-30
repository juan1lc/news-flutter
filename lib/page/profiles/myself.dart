import 'package:flutter/material.dart';
import 'package:news_app/page/profiles/editpages/editing_userinfo.dart';
import 'package:news_app/util/color.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../provider/user_info.dart';
import '../../util/color.dart';

class MyselfPage extends StatefulWidget{
  const MyselfPage({Key? key}) : super(key: key);

  @override
  _MyselfPage createState() => _MyselfPage();
}

class _MyselfPage extends State<MyselfPage>{
  User? userInfo;
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInfoProvider>(
      builder: (context, loginProvider, child){
        bool isLogin = loginProvider.isLogin; // Test use
        print('登录状态：isLogin=' + isLogin.toString());

        if(isLogin) userInfo = loginProvider.loginUser;
        return !isLogin?
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {Navigator.pushNamed(context, '/login');},
                elevation: 2.0,
                fillColor: loginColor,
                child: const Text(
                  "登录", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    wordSpacing: 2,
                  )
                ),
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
              ),
              const SizedBox(height: 20,),
              const Text("您还未登录，请先登录")
            ],
          ),
        ):Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('个 人 中 心'),
              titleTextStyle: TextStyle(
                  color: loginColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
              backgroundColor: primary,
            ),
            body: Column(
              children: <Widget> [
                Container(
                  height: 100,
                  color: primary,
                  padding: EdgeInsets.only(top:16, left:16),
                  child: Row(
                    children: <Widget> [
                      CircleAvatar(backgroundImage: AssetImage(userInfo!.photo.toString()), radius: 28,),
                      SizedBox(width: 20,),
                      Expanded(
                        child: ListTile(
                          title: Text(userInfo!.username, style: TextStyle(fontSize: 20),),
                          subtitle: Text(userInfo!.introduction.toString(), style: TextStyle(fontSize: 16),),
                        ),
                      ),
                      _IconContainer(Icons.keyboard_arrow_right_rounded, "", userInfo!),
                    ],
                  ),
                ),
                Container(
                    color: primary,

                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child:ListTile(
                            title: new Center(child: Text("7")),
                            subtitle: new Center(child: Text("动态"),),
                          ),
                        ),
                        Expanded(
                          child:ListTile(
                            title: new Center(child: Text("200")),
                            subtitle: new Center(child: Text("关注"),),
                          ),
                        ),
                        Expanded(
                          child:ListTile(
                            title: new Center(child: Text("20")),
                            subtitle: new Center(child: Text("粉丝"),),
                          ),
                        ),

                      ],
                    )
                ),
                SizedBox(height: 5),
                Container(
                  color: primary,
                  child: ListTile(
                    leading: Icon(Icons.thumb_up),
                    title: Text("我的点赞"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                Container(
                  color: primary,
                  child: ListTile(
                    leading: Icon(Icons.star),
                    title: Text("我的收藏"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                Container(
                  color: primary,
                  child: ListTile(
                    leading: Icon(Icons.palette),
                    title: Text("我的动态"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                Container(
                  color: primary,
                  child: ListTile(
                    leading: Icon(Icons.drafts),
                    title: Text("我的草稿箱"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                Container(
                  color: primary,
                  child: ListTile(
                    leading: Icon(Icons.history),
                    title: Text("浏览记录"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ],
            )
        );
      }

    );
  }
}

class _IconContainer extends StatelessWidget {
  final IconData iconImage;
  final String iconName;
  final User userInfo;
  _IconContainer(this.iconImage, this.iconName, this.userInfo, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  iconImage,
                  size: 25,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoEditing(userInfo: userInfo,)),);
                  // Map arguments = {["id"]:userInfo.id, ["username"]:userInfo.username, ["birth"]:userInfo.birth.toString(),
                  // ["address"]:userInfo.address.toString(), ["phone"]:userInfo.phone.toString(), ["mail"]:userInfo.mail.toString(),
                  // ["photo"]:userInfo.photo.toString(), ["gender"]:userInfo.gender.toString(), ["introduction"]: userInfo.introduction.toString()};
                  // Navigator.pushNamed(context, "/editingInfo", arguments: arguments);
                }
            ),
          ],
        ));
  }
}
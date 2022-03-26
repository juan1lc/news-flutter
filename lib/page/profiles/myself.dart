import 'package:flutter/material.dart';
import 'package:news_app/page/profiles/editpages/editing_userinfo.dart';
import 'package:news_app/util/color.dart';
import 'package:news_app/route/routes.dart';

import '../../util/color.dart';

class MyselfPage extends StatefulWidget{
  const MyselfPage({Key? key}) : super(key: key);

  @override
  _MyselfPage createState() => _MyselfPage();
}

class _MyselfPage extends State<MyselfPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                CircleAvatar(backgroundImage: AssetImage("assets/images/defaultAvatar.png"), radius: 20,),
                SizedBox(width: 30,),
                Expanded(
                  child: ListTile(
                    title: Text("用户昵称"),
                    subtitle: Text("签名"),
                  ),
                ),
                _IconContainer(Icons.keyboard_arrow_right_rounded, "", "/editingInfo"),
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
}

class _IconContainer extends StatelessWidget {
  final IconData iconImage;
  final String iconName;
  final String route;
  _IconContainer(this.iconImage, this.iconName, this.route, {Key? key})
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
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new UserInfoEditing()),
                  );
                }
            ),
            // Text(this.iconName,
            //     style: TextStyle(fontSize: 13, color: Colors.grey))
          ],
        ));
  }
}
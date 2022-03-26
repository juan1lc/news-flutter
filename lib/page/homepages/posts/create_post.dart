import 'package:flutter/material.dart';
import 'package:news_app/util/color.dart';
import 'package:news_app/widget/Banner.dart';

import '../../../widget/create_head.dart';

class CreatePage extends StatefulWidget{
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePage createState() => _CreatePage();
}

class _CreatePage extends State<CreatePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CreateHead(),
        foregroundColor: active,
        backgroundColor: primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget> [
              SizedBox(height: 2,),
              Form(
                  child: TextFormField(
                    maxLength: 255,
                    keyboardType: TextInputType.text,
                    maxLines: 25,
                    decoration: InputDecoration(
                      border: InputBorder.none,//去掉输入框的下滑线
                      fillColor: nav,
                      filled: true,
                      hintText: '分享你的生活动态...',
                      // border: OutlineInputBorder(
                      //     borderRadius:BorderRadius.circular(4)
                      // ),
                    ),
                  )
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconContainer(Icons.tag, "添加标签", '/'),
                  IconContainer(Icons.perm_media, "选择图片", '/'),
                  IconContainer(Icons.alternate_email, "艾特朋友", "/")
                ],
              )
            ],
          ),
        ),
      )
    );
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
        child: Column(
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
            // Text(this.iconName,
            //     style: TextStyle(fontSize: 13, color: Colors.grey))
          ],
        ));
  }
}
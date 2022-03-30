import 'package:flutter/material.dart';
import 'package:news_app/page/homepages/posts/post_detail.dart';

import '../../../util/color.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.photo,
    required this.username,
    required this.content})
      : super(key: key);

  final String photo, username, content;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(top: 10),
        child: Column(
            children: <Widget> [
              Container(
                padding: const EdgeInsets.only(left: 20,right: 20, top: 10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Text("热门动态",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: (){},
                        child: Text("更多",
                          style: TextStyle(color: loginColor,),
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 2),
              InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder:
                  //     (context)=>PostDetail()));
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 20,right: 20, top: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5)
                  ),
                  child: Column(
                    children : <Widget> [
                      Row(
                        children: <Widget> [
                          CircleAvatar(backgroundImage: AssetImage(photo), radius: 25,),
                          SizedBox(width: 20,),
                          Text(username),
                          Spacer(),
                          OutlinedButton(
                            onPressed: (){},
                            child: Text("+ 关注", style: TextStyle(color: loginColor),),
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(BorderSide(width: 1,color: Color(0xffCAD0DB))),//边框
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5,),

                      Text(
                        content,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                      const SizedBox(height: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconContainer(Icons.repeat, "11", '/'),
                          IconContainer(Icons.comment, "113", '/'),
                          IconContainer(Icons.thumb_up, "1140", "/")
                        ],
                      )
                  ]),
                ),
              )
        ]),
      ),
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

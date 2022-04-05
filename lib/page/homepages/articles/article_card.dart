import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/page/homepages/articles/article_detail.dart';

import '../../../util/color.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key,
    required this.title,
    required this.introduction,
    required this.publisher,
    required this.publish_time,
    required this.publisher_avatar,
    required this.id,
    this.img1, this.img2, this.img3,
    this.userid
      })
      : super(key: key);

  final String title, introduction, publisher, publish_time, publisher_avatar;
  final String id;
  final String? img1, img2, img3;
  final String? userid;


  @override
  Widget build(BuildContext context) {
    int cnt;
    if(img1==null) {
      cnt=0;
    } else if(img1!=null && img2==null) {
      cnt=1;
    } else if(img1!=null && img2!=null && img3==null) {
      cnt=2;
    } else {
      cnt=3;
    }

    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: nav,
        padding: const EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 20),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5, color: Colors.black38),
          )),
          child: InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(
                builder: (context)=>ArticleDetailPage(id: id, userid: userid,))
            );},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                Text(title, style: const TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w600),),
                const SizedBox(height: 10,),
                Text(introduction, style: const TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w400)),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget> [
                    (img1!=null)?Container(
                      width: (MediaQuery.of(context).size.width-20)/cnt,
                      height: 90,
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: Image.asset(img1!, fit: BoxFit.cover,),
                    ):const SizedBox(width: 0,),
                    (img2!=null)?Container(
                      width: (MediaQuery.of(context).size.width-20)/cnt,
                      height: 90,
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: Image.asset(img2!, fit: BoxFit.cover,),
                    ):const SizedBox(width: 0),
                    (img3!=null)?Container(
                      width: (MediaQuery.of(context).size.width-20)/cnt,
                      height: 90,
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: Image.asset(img1!, fit: BoxFit.cover,),
                    ):const SizedBox(width: 0),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(backgroundImage: AssetImage(publisher_avatar),radius:20),
                    const SizedBox(width: 10,),
                    Text(publisher),
                    const SizedBox(width: 10,),
                    Text(publish_time),
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),

      ),
    );
  }
}



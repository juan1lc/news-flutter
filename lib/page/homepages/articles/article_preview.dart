import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/color.dart';

class ArticlePreview extends StatelessWidget {
  const ArticlePreview({Key? key,
    required this.title,
    required this.introduction,
    required this.publisher,
    required this.publish_time,
    this.img1, this.img2, this.img3,
      })
      : super(key: key);

  final String title, introduction, publisher, publish_time;
  final String? img1, img2, img3;


  @override
  Widget build(BuildContext context) {
    var cnt;
    if(img1==null) cnt=0;
    else if(img1!=null && img2==null) cnt=1;
    else if(img1!=null && img2!=null && img3==null) cnt=2;
    else cnt=3;

    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: nav,
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.5, color: Colors.black38),
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Text(title, style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w600),),
              SizedBox(height: 10,),
              Text(introduction, style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w400)),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  Container(
                    width: (MediaQuery.of(context).size.width-20)/cnt,
                    height: 90,
                    padding: EdgeInsets.only(left: 2, right: 2),
                    child: Image.asset(img1!, fit: BoxFit.cover,),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width-20)/cnt,
                    height: 90,
                    padding: EdgeInsets.only(left: 2, right: 2),
                    child: Image.asset(img2!, fit: BoxFit.cover,),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width-20)/cnt,
                    height: 90,
                    padding: EdgeInsets.only(left: 2, right: 2),
                    child: Image.asset(img1!, fit: BoxFit.cover,),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(publisher),
                  SizedBox(width: 10,),
                  Text(publish_time),
                ],
              )
            ],
          ),
        ),

      ),
    );
  }
}



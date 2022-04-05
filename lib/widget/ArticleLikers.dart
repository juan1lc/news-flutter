import 'package:flutter/material.dart';
import 'package:news_app/models/articles/articleLikers.dart';

import '../util/color.dart';

class ArticleLikersView extends StatefulWidget {
  const ArticleLikersView({Key? key, required this.articleLikers}) : super(key: key);

  final List<ArticleLikers> articleLikers;
  @override
  _ArticleLikersViewState createState() => _ArticleLikersViewState();
}

class _ArticleLikersViewState extends State<ArticleLikersView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      color: primary,
      child: ListView.builder(
        itemCount: widget.articleLikers.length,

        itemBuilder: (BuildContext context, int index){
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left:20, right: 20, top: 8, bottom: 8),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.articleLikers[index].photo),
                  radius: 25,
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.articleLikers[index].username, style: TextStyle(
                        color: Colors.black87,fontSize: 18
                    ),),
                    SizedBox(height: 2,),
                    Text(widget.articleLikers[index].liketime, style: TextStyle(
                        color: Colors.black45,fontSize: 15
                    ),),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.thumb_up_outlined, color: loginColor,),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/page/favoritepages/post_preview.dart';

import 'article_fav_preview.dart';

class LikeForm extends StatelessWidget {
  const LikeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PostPreview(
              photo: "assets/images/avatar1.jpg",
              username: "昵称",
              content: "content",
              img: "assets/images/article0.jpg"
          ),
          SizedBox(height: 5,),
          ArticleFavPreview(
              photo: "assets/images/avatar1.jpg",
              username: "昵称",
              content: "content",
              img: "assets/images/article0.jpg",
              title: "title")
        ],
      ),
    );
  }
}

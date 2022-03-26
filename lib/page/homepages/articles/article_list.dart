import 'package:flutter/material.dart';

import 'article_preview.dart';



class ArticleList extends StatefulWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ArticlePreview(
              title: "test",
              introduction: "textjdaghkfdfdkjnjnfer",
              publisher:"我",
            publish_time:"200049u3",
            img1:"assets/images/article0.jpg",
            img2:"assets/images/article1.jpg",
            img3:"assets/images/article0.jpg"
          ),
          ArticlePreview(
              title: "test",
              introduction: "textjdaghkfdfdkjnjnfer",
              publisher:"我",
              publish_time:"200049u3",
              img1:"assets/images/article0.jpg",
              img2:"assets/images/article1.jpg",
              img3:"assets/images/article0.jpg"
          ),
          ArticlePreview(
              title: "test",
              introduction: "agaraegregaegreagreafeaerferafaefreafraefearfregregaegrea",
              publisher:"我",
              publish_time:"200049u3",
              img1:"assets/images/article0.jpg",
              img2:"assets/images/article1.jpg",
              img3:"assets/images/article0.jpg"
          ),
          ArticlePreview(
              title: "test",
              introduction: "textjdaghkfdfdkjnjnfer",
              publisher:"我",
              publish_time:"200049u3",
              img1:"assets/images/article0.jpg",
              img2:"assets/images/article1.jpg",
              img3:"assets/images/article0.jpg"
          )
        ],
      ),
    );
  }
}

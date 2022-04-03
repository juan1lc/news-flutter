

import 'article.dart';

class ArticleVo{
  final String authorId;
  final String author;
  final String authorPhoto;
  final Article article;

  ArticleVo({required this.authorId, required this.author,
    required this.authorPhoto, required this.article
  });

  @override
  String toString() {
    return '{authorId: '+authorId
    +', author: '+author
    +', authorPhoto: '+authorPhoto
    +', article: '+article.toString();
  }

  factory ArticleVo.fromJson(Map<String, dynamic> json){
    Article article = Article.fromJson(json['article']);
    return ArticleVo(
        authorId: json.putIfAbsent('id', () => null),
        authorPhoto: json.putIfAbsent('authorPhoto', () => null),
        author: json.putIfAbsent('author', () => null),
        article: article
    );
  }
}
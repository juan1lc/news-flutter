import 'package:news_app/models/postCard.dart';

class PostVo {
  final String authorPhoto;
  final String author;

  final PostCard postCard;

  PostVo({required this.authorPhoto, required this.author, required this.postCard});

  @override
  String toString() {

    return '{authorPhoto: '+ authorPhoto
        +', author: '+author.toString()
        +', postCard: '+postCard.toString()
        +'}';
  }

  factory PostVo.fromJson(Map<String, dynamic> json){
    PostCard postCard = PostCard.fromJson(json['post']);
    return PostVo(
        authorPhoto: json.putIfAbsent('authorPhoto', () => null),
        author: json.putIfAbsent('author', () => null),
        postCard: postCard
    );
  }
}
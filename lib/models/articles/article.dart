class Article{
  final String id;
  final String publishTime;
  final String? articleImgs;
  final String userId;
  final String typeId;
  final String original_time;
  final int article_like;
  final String? article_like_user;
  final int article_status;  //默认发布
  final int article_browse;
  final int comment_count;
  final String? source;
  final String title;
  final String introduction;
  final String content;

  Article({required this.id, required this.publishTime, this.articleImgs,
    required this.userId, required this.typeId, required this.original_time,
    required this.article_like, this.article_like_user, required this.article_status,
    required this.article_browse, required this.comment_count, this.source,
    required this.title, required this.introduction, required this.content
  });

  @override
  String toString() {
    return '{id: '+id
        +', publishTime: '+ publishTime.toString()
        +', userId: '+ userId
        +', typeId: '+ typeId
        +', articleImgs: '+ articleImgs.toString()
        +', original_time: '+ original_time.toString()
        +', article_like: '+article_like.toString()
        +', article_like_user: '+article_like_user.toString()
        +', article_status: '+article_status.toString()
        +', article_browse: '+article_browse.toString()
        +', comment_count: '+comment_count.toString()
        +', source: '+source.toString()
        +', title: '+ title
        +', introduction: '+ introduction
        +', content: '+content
        +'}';
  }

  Map<String, dynamic> toJson(Article article){
    return {
      'id': id,
      'publishTime': publishTime,
      'userId': userId,
      'typeId': typeId,
      'articleImgs': articleImgs,
      'original_time': original_time,
      'article_like': article_like,
      'article_like_user': article_like_user,
      'article_status': article_status,
      'article_browse':article_browse,
      'comment_count': comment_count,
      'source': source,
      'title': title,
      'introduction': introduction,
      'content': content
    };
  }

  factory Article.fromJson(Map<String, dynamic> json){
    String time = json['publishTime'].toString();
    String time1 = json['original_time'].toString();
    String publishTime = time.substring(0, 10)+' '+ time.substring(11, 18);
    String original_time = time1.substring(0, 10)+' '+ time1.substring(11, 18);
    return Article(
        id: json.putIfAbsent('id', () => null),
        userId: json.putIfAbsent('userId', () => null),
        typeId: json.putIfAbsent('typeId', () => null),
        publishTime: publishTime,
        original_time: original_time,
        articleImgs: json.putIfAbsent('articleImgs', () => ''),
        article_like: json.putIfAbsent('article_like', () => 0),
        article_like_user: json.putIfAbsent('article_like_user', () => ''),
        article_status: json.putIfAbsent('article_status', () => 0),
        article_browse: json.putIfAbsent('article_browse', () => 0),
        comment_count: json.putIfAbsent('comment_count', () => 0),
        source: json.putIfAbsent('source', () => ''),
        title: json.putIfAbsent('title', () => null),
        introduction: json.putIfAbsent('introduction', () => null),
        content: json.putIfAbsent('content', () => null),
    );
  }
}
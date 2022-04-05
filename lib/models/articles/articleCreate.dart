class ArticleCreate{
  final DateTime publishTime;
  final String? articleImgs;
  final String userId;
  final String typeId;
  final DateTime original_time;
  final int article_like;
  final String? article_like_user;
  final int article_status=0;  //默认发布
  final int article_browse=0;
  final int comment_count=0;
  final String? source;
  final String title;
  final String introduction;
  final String content;

  ArticleCreate({required this.publishTime, this.articleImgs,
    required this.userId, required this.typeId, required this.original_time,
    required this.article_like, this.article_like_user, this.source,
    required this.title, required this.introduction, required this.content
  });

  @override
  String toString() {
    return '{publishTime: '+ publishTime.toString()
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

  Map<String, dynamic> toJson(ArticleCreate article){
    return {
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
}
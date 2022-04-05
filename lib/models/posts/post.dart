class CreatePost {
  final String? postImgs;
  final String userId;
  final String content;
  final bool isrepost;
  final String? tags;
  final int postLike;
  final int postBrowse;
  final int commentCount;
  final int postStatus;
  final String location;
  final DateTime? createTime;
  final DateTime? updateTime;

  CreatePost({this.postImgs, required this.userId, required this.content,
    required this.isrepost, this.tags, required this.postLike,
    required this.postBrowse, required this.commentCount,
    required this.postStatus, required this.location, this.createTime,
    this.updateTime, }
    );

  @override
  String toString() {
    String post='false';
    if(isrepost==true) post='true';
    return '{postImgs: '+postImgs.toString()
        +', userId: '+ userId
        +', content: '+content
        +', isrepost: '+post
        +', tags: '+tags.toString()
        +', postLike: '+postLike.toString()
        +', postBrowse: '+postBrowse.toString()
        +', commentCount: '+commentCount.toString()
        +', postStatus: '+postStatus.toString()
        +', location: '+location.toString()
        +', createTime: '+createTime.toString()
        +', updateTime: '+updateTime.toString()
        +'}';
  }

  ///
  /// 将Model转为Json
  ///
  Map<String, dynamic> toJson(CreatePost createPost){
    return {
      'postImgs':postImgs,
      'userId':userId,
      'content':content,
      'isrepost':isrepost,
      'tags':tags,
      'postLike':postLike,
      'postBrowse':postBrowse,
      'commentCount':commentCount,
      'postStatus':postStatus,
      'location':location,
      'createTime':createTime,
      'updateTime':updateTime,
    };
  }

}


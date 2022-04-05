class PostCard {
  final String id;
  final String userid;
  final String? postImgs;
  final String content;
  final bool isrepost;
  final String? tags;
  late final int postLike;
  final int postBrowse;
  final int commentCount;
  final String location;
  final String? updateTime;

  PostCard({required this.id, required this.userid, this.postImgs, required this.content, required this.isrepost,
      this.tags, required this.postLike, required this.postBrowse, required this.commentCount,
      required this.location, this.updateTime});

  @override
  String toString() {
    String post='false';
    if(isrepost==true) post='true';
    return '{id: '+ id
        +'userid: '+userid.toString()
        +'postImgs: '+postImgs.toString()
        +', content: '+content
        +', isrepost: '+post
        +', tags: '+tags.toString()
        +', postLike: '+postLike.toString()
        +', postBrowse: '+postBrowse.toString()
        +', commentCount: '+commentCount.toString()
        +', location: '+location.toString()
        +', updateTime: '+updateTime.toString()
        +'}';
  }

  factory PostCard.fromJson(Map<String, dynamic> json){
    String time = json['updateTime'].toString();
    String updateTime = time.substring(0, 10)+' '+ time.substring(11, 18);
    return PostCard(
      id: json.putIfAbsent('id', () => null),
      userid: json.putIfAbsent('userid', () => null),
      postImgs: json.putIfAbsent('postImgs', () => ''),
      content: json.putIfAbsent('content', () => null),
        isrepost: json.putIfAbsent('isrepost', () => false),
      tags: json.putIfAbsent('tags', () => ''),
      postLike: json.putIfAbsent('postLike', () => 0),
        postBrowse: json.putIfAbsent('postBrowse', () => 0),
        commentCount: json.putIfAbsent('commentCount', () => 0),
      location: json.putIfAbsent('location', () => ''),
      updateTime: updateTime
    );
  }
}
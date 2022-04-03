class PostLikers{
  final String id;
  final String postid;
  final String userid;
  final String username;
  final String photo;
  final String liketime;

  PostLikers({required this.id, required this.postid, required this.userid,
    required this.username, required this.photo, required this.liketime, });

  @override
  String toString() {

    return '{id: '+ id
        +'postid: '+postid
        +', userid: '+userid
        +', username: '+username
        +', photo: '+photo
        +', liketime: '+liketime
        +'}';
  }

  factory PostLikers.fromJson(Map<String, dynamic> json){
    String time = json['liketime'].toString();
    String liketime = time.substring(0, 10)+' '+ time.substring(11, 18);
    return PostLikers(
      id: json.putIfAbsent('id', () => null),
      postid: json.putIfAbsent('postid', () => null),
      userid: json.putIfAbsent('userid', () => null),
      username: json.putIfAbsent('username', () => null),
      photo: json.putIfAbsent('photo', () => null),
      liketime: liketime
    );
  }
}
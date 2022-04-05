class ArticleLikers{

  final String id;
  final String articleid;
  final String userid;
  final String username;
  final String photo;
  final String liketime;

  ArticleLikers({required this.id, required this.articleid, required this.userid,
    required this.username, required this.photo, required this.liketime, });

  @override
  String toString() {

    return '{id: '+ id
        +', articleid: '+articleid
        +', userid: '+userid
        +', username: '+username
        +', photo: '+photo
        +', liketime: '+liketime
        +'}';
  }

  factory ArticleLikers.fromJson(Map<String, dynamic> json){
    String time = json['liketime'].toString();
    String liketime = time.substring(0, 10)+' '+ time.substring(11, 18);
    return ArticleLikers(
        id: json.putIfAbsent('id', () => null),
        articleid: json.putIfAbsent('articleid', () => null),
        userid: json.putIfAbsent('userid', () => null),
        username: json.putIfAbsent('username', () => null),
        photo: json.putIfAbsent('photo', () => null),
        liketime: liketime
    );
  }
}
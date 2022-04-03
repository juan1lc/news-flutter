class ArticlePreview {
  final String id;
  final String publishTime;
  final String authorId;
  final String author;
  final String? source;
  final String title;
  final String introduction;
  final String authorPhoto;

  ArticlePreview({required this.id, required this.publishTime,
    required this.authorId, required this.author, this.source,
    required this.title, required this.introduction, required this.authorPhoto
  });

  @override
  String toString() {
    return '{id: '+ id
        +', publishTime: '+ publishTime.toString()
        +', authorId: '+ authorId
        +', author: '+ author
        +', source: '+ source.toString()
        +', title: '+ title
        +', introduction: '+ introduction
        +', authorPhoto: '+authorPhoto
        +'}';
  }

  factory ArticlePreview.fromJson(Map<String, dynamic> json){
    String time = json['publishTime'].toString();
    String publishTime = time.substring(0, 10)+' '+ time.substring(11, 18);
    return ArticlePreview(
        id: json.putIfAbsent('id', () => null),
        authorId: json.putIfAbsent('authorId', () => null),
        author: json.putIfAbsent('author', () => null),
        source: json.putIfAbsent('source', () => ''),
        title: json.putIfAbsent('title', () => null),
        introduction: json.putIfAbsent('introduction', () => null),
        authorPhoto: json.putIfAbsent('authorPhoto', () => 0),
        publishTime: publishTime
    );
  }
}
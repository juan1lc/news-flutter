class Tag{
  final String id;
  final String name;
  final String tagdesc;

  Tag({required this.id, required this.name, required this.tagdesc});

  @override
  String toString(){
    return 'id: ' + id
    +', name:'+ name
    +', tagdesc' + tagdesc;
  }

  factory Tag.fromJson(Map<String, dynamic> json){
    return Tag(
      id: json.putIfAbsent('id',() => null),
      name: json.putIfAbsent('name',() => null),
      tagdesc: json.putIfAbsent('tagdesc', () => null)
    );
  }
}
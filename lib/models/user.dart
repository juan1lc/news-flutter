import 'dart:convert';
///
/// 用户模型
/// 用于用户登录、注册
///

class User {
  final String id;
  final String role_id;
  late final String username;
  final String? photo;
  late final String? phone;
  late final String? mail;
  late final String? birth;
  late final String? address;
  late final String? gender;
  late final String? introduction;


  User({required this.id ,required this.role_id, required this.username, this.photo, this.phone, this.mail,
      this.birth, this.address, this.gender, this.introduction, String? password});


  @override
  String toString() {
    return '{id: '+id.toString()
        +', username: '+username
        +', role_id: '+role_id
        +', mail: '+mail.toString()
        +', phone: '+phone.toString()
        +', birth: '+birth.toString()
        +', address: '+address.toString()
        +', gender: '+gender.toString()
        +', photo: '+photo.toString()
        +', introduction: '+introduction.toString()
        +'}';
  }

  ///
  /// Json数据转换
  ///
  factory User.fromJson(Map<String,dynamic> json){
    print('用户model获取服务器数据信息：json=$json');
    String gender;
    if(json['gender']=='MALE') gender='男';
    else if(json['gender']=='FEMALE') gender='女';
    else gender='未知';
    return User(
      id: json.putIfAbsent('id',() => null), // 非空
      username:json.putIfAbsent('username',() => null), // 非空
      role_id:json.putIfAbsent('role_id', () => null), // 非空
      mail: json.putIfAbsent('mail', () => '空'),
      phone:json.putIfAbsent('phone',() => '空'), // 非空
      birth:json.putIfAbsent('birth', () => '空'),
      address:json.putIfAbsent('address', () => '空'),
      photo:json.putIfAbsent('photo', () => '空'),
      introduction:json.putIfAbsent('introduction', () => '空'),
      gender: gender
    );
  }

  ///
  /// 将Model转为Json
  ///
  Map<String, dynamic> toJson(User user){
    return {
      'username':username,
      'role_id':role_id,
      'mail':mail,
      'phone':phone,
      'birth':birth,
      'address':address,
      'gender':gender,
      'photo':photo,
      'introduction':introduction,
    };
  }



}
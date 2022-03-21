import 'dart:convert';
///
/// 用户模型
/// 用于用户登录、注册
///
class User {
  final String id;
  final String role_id;
  final String username;
  final String? photo;
  final String? phone;
  final String? mail;
  final String? birth;
  final String? address;
  final String? gender;
  final String? introduction;


  User({required this.id ,required this.role_id, required this.username, this.photo, this.phone, this.mail,
      this.birth, this.address, this.gender, this.introduction});


  @override
  String toString() {
    return '{id: '+id
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

  // ///
  // /// 创建用户登录模型
  // ///
  // factory User.createLoginUser(String username, String password){
  //   return User(username: username, password: password);
  // }

  ///
  /// Json数据转换
  ///
  factory User.fromJson(Map<String,dynamic> json){
    print('用户model获取服务器数据信息：json=$json');
    return User(
      id: json.putIfAbsent('id',() => null), // 非空
      username:json.putIfAbsent('username',() => null), // 非空
      role_id:json.putIfAbsent('role_id', () => null), // 非空
      mail: json.putIfAbsent('mail', () => ''),
      phone:json.putIfAbsent('phone',() => null), // 非空
      birth:json.putIfAbsent('birth', () => ''),
      address:json.putIfAbsent('address', () => ''),
      photo:json.putIfAbsent('photo', () => ''),
      introduction:json.putIfAbsent('introduction', () => '')
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
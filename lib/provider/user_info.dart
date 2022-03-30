import 'package:flutter/cupertino.dart';

import '../models/user.dart';

// User testUser=User(id: "1", role_id: "1", username: "testUser",
//     photo: "assets/images/defaultAvatar.png", address: "niceday",
//     birth: "2000-09-12", mail: "123@qq", introduction: "testIntro",
//      gender:"MALE");


class UserInfoProvider with ChangeNotifier{

  bool _isLogin=false;

  late User _user;

  bool get isLogin => _isLogin;

  User get loginUser => _user;

  String? get userId => _user.id;

  void doLogin(User userInfo){
    print("doLogin: userInfo" + userInfo.toString());
    _user = userInfo;
    _isLogin = _user != null ? true : false;

    notifyListeners();
  }

  void updateInfo(String columnName, String columnValue){
    if(columnName=="username") {
      User newUser = new User(id: _user.id, username: columnValue, role_id: _user.role_id,
      address: _user.address, gender: _user.gender, photo: _user.photo, phone: _user.phone,
      mail: _user.mail, introduction: _user.introduction, birth: _user.birth);
      _user=newUser;
    } else if(columnName=="phone") {
      User newUser = new User(id: _user.id, username: _user.username, role_id: _user.role_id,
          address: _user.address, gender: _user.gender, photo: _user.photo, phone: columnValue,
          mail: _user.mail, introduction: _user.introduction, birth: _user.birth);
      _user=newUser;
    }
    else if(columnName=="mail") {
      User newUser = new User(id: _user.id, username: _user.username, role_id: _user.role_id,
          address: _user.address, gender: _user.gender, photo: _user.photo, phone: _user.phone,
          mail: columnValue, introduction: _user.introduction, birth: _user.birth);
      _user=newUser;
    }
    else if(columnName=="birth") {
      User newUser = new User(id: _user.id, username: _user.username, role_id: _user.role_id,
          address: _user.address, gender: _user.gender, photo: _user.photo, phone: _user.phone,
          mail: _user.mail, introduction: _user.introduction, birth: columnValue);
      _user=newUser;
    }
    else if(columnName=="gender") {
      User newUser = new User(id: _user.id, username: _user.username, role_id: _user.role_id,
          address: _user.address, gender: columnValue, photo: _user.photo, phone: _user.phone,
          mail: _user.mail, introduction: _user.introduction, birth: _user.birth);
      _user=newUser;
    }
    else if(columnName=="address") {
      User newUser = new User(id: _user.id, username: _user.username, role_id: _user.role_id,
          address: columnValue, gender: _user.gender, photo: _user.photo, phone: _user.phone,
          mail: _user.mail, introduction: _user.introduction, birth: _user.birth);
      _user=newUser;
    }
    else if(columnName=="introduction") {
      User newUser = new User(id: _user.id, username: _user.username, role_id: _user.role_id,
          address: _user.address, gender: _user.gender, photo: _user.photo, phone: _user.phone,
          mail: _user.mail, introduction: columnValue, birth: _user.birth);
      _user=newUser;
    }

    print(_user);
    notifyListeners();
  }
}
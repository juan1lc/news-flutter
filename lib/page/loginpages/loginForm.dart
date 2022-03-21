import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../api/api.dart';
import '../../models/user.dart';
import '../../util/color.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  State<LoginForm> createState() => _loginFormState();
}

class _loginFormState extends State<LoginForm> {

  /// 密码
  String _password = '';
  /// 用户名
  String _username = '';
  bool _isButtonAbled = false;
  bool _allowLogin = false;
  Map _userInfo = {};

  _findUser(String username, String password) async{

    print(API.findUserAPI + "?username=" + username + "&password=" + password);

    Uri apiUrl = Uri.parse(API.findUserAPI + "?username=" + username + "&password=" + password);
    var response = await http.post(apiUrl);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      try {
        setState(() {
          if (json.decode(response.body)["id"] != null) {
            _userInfo = json.decode(response.body);
            _allowLogin = true;
          } else {
            _allowLogin = false;
          }
        });
      } catch (error) {
        _allowLogin = false;
      }
    } else {
      _allowLogin = false;
      print(response.statusCode);
    }
  }

  _doLogin(String username, String password) async {
    await _findUser(username, password);

    if (_allowLogin == true) {
      // await saveLoginInfo("true", this.userInfo["userId"].toString(),
      //     this.userInfo["userPhoto"]);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("提示"),
              content: const Text("登录成功"),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.popAndPushNamed(context, "/");
                    },
                    child: const Text("确定")),
              ],
            );
          });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("账号或密码错误"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("确定")),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 35,
          top: 42,
          right: 35
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "登 录",
            style: TextStyle(
                fontSize: 24,
                color: Color(0xFF002251),
                letterSpacing: 0,
                fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "欢迎来到毕业生噩梦岛",
            style: TextStyle(
                fontSize: 14,
                color: Color(0xFF7A869A),
                letterSpacing: 0,
                fontWeight: FontWeight.w400
            ),
          ),
          const SizedBox(height: 5,),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '请输入用户名/手机号',
              labelText: '用户名/手机号',
            ),
            onSaved: (String? value) {
              _username = value.toString();
            },
            // validator: (String? value) {
            //   return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
            // },
          ),
          const SizedBox(height: 5,),

          TextFormField(
            decoration: const InputDecoration(
              hintText: '请输入密码',
              labelText: '密码',
            ),
            onSaved: (String? value) {
              _password = value.toString();
            },
            // validator: (String? value) {
            //   return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
            // },
          ),
          const SizedBox(height: 24),
          const Text("忘记密码?",
            style: TextStyle(
                fontSize: 13,
                color: primary
            ),
          ),
          const SizedBox(height: 24),
          FractionallySizedBox(
            widthFactor: 1,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(loginColor)),
              onPressed: () {
                _doLogin(_username, _password);
                Navigator.pushNamed(context, '/');
              },
              child: const Text("登 录"),
            ),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("没有账号?", style: TextStyle(
                  color: Color(0xFF7A869A),
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400
              ),),
              TextButton(
                  child: const Text(
                    "立即注册",
                    style: TextStyle(
                        color: loginColor,
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  onPressed:(){}
              )
            ],
          )
        ],
      ),
    );
  }
}
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/page/loginpages/registerPage.dart';
import 'package:news_app/provider/user_info_provider.dart';
import 'package:provider/provider.dart';
import '../../api/api.dart';
import '../../models/user.dart';
import '../../util/color.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  State<LoginForm> createState() => _loginFormState();
}

class _loginFormState extends State<LoginForm> {

  /// 表单状态
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();
  //控制器
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  String _password = '';
  String _username = '';

  bool _allowLogin = false;
  bool _isShowClear = false;
  bool _isShowPwd = false;
  late User _userInfo;

  _findUser(String username, String password) async{

    //print(API.findUserAPI + "?username=" + username + "&password=" + password);

    Uri apiUrl = Uri.parse(API.findUserAPI);
    //print(apiUrl);
    var response = await http.post(apiUrl, body: {"username":username, "password": password});
    if (response.statusCode == 200) {
      try {
        setState(() {
          if (json.decode(response.body)["id"] != null) {
            _userInfo=User.fromJson(json.decode(response.body));

            UserInfoProvider userInfoProvider = Provider.of<UserInfoProvider>(context,listen: false);
            userInfoProvider.doLogin(_userInfo);
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

    //设置焦点监听
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);

    _nameController.addListener((){
      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (_nameController.text.isNotEmpty) {
        _isShowClear = true;
      }else{
        _isShowClear = false;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _pwController.dispose();
    _nameController.dispose();
    // 移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    super.dispose();
  }

  // 监听焦点
  Future _focusNodeListener() async{
    if(_focusNodeUserName.hasFocus){
      print("用户名框获取焦点");
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
    }
  }

  /// 验证用户名
  String? _validateUserName(value){
    if (value.isEmpty) {
      return '用户名不能为空';
    }
    else if(value.trim().toString().length < 2 || value.trim().toString().length>64){
      return '用户名长度在2~64个字符之间';
    }
    return null;
  }

  /// 验证密码
  String? _validatePassWord(value){
    if (value.isEmpty) {
      return '密码不能为空';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 35,
          top: 35,
          right: 35
      ),
      child: Form(
      key: _formKey,
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
              "欢迎来到毕业生交流社区",
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7A869A),
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400
              ),
            ),
            const SizedBox(height: 5,),
            TextFormField(
              controller: _nameController,
              focusNode: _focusNodeUserName,
              decoration: InputDecoration(
                hintText: '请输入用户名/手机号',
                labelText: '用户名/手机号',
                suffixIcon: _nameController.text.isNotEmpty ? IconButton(
                      onPressed: () {
                        _nameController.clear();
                      },
                      icon: const Icon(Icons.cancel)
                  ) : null
              ),
              onSaved: (String? value) {
                _username = value.toString();
              },
              validator: _validateUserName,
            ),
            const SizedBox(height: 5,),

            TextFormField(
              controller: _pwController,
              focusNode: _focusNodePassWord,
              obscureText: !_isShowPwd,
              decoration: InputDecoration(
                hintText: '请输入密码',
                labelText: '密码',
                  // 是否显示密码
                  suffixIcon: IconButton(
                    icon: Icon((_isShowPwd) ? Icons.visibility : Icons.visibility_off),
                    // 点击改变显示或隐藏密码
                    onPressed: (){
                      setState(() {
                        _isShowPwd = !_isShowPwd;
                      });
                    },
                  )
              ),
              onSaved: (String? value) {
                _password = value.toString();
              },
              validator: _validatePassWord,
            ),
            const SizedBox(height: 20),
            const Text("忘记密码?",
              style: TextStyle(
                  fontSize: 13,
                  color: primary
              ),
            ),
            const SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 1,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(loginColor),
                  textStyle: MaterialStateProperty.all(TextStyle(color: nav)),
                ),
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    _doLogin(_nameController.text, _pwController.text);
                  }
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
                    onPressed:(){
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>RegisterPage()));
                    }
                )
              ],
            )
          ],
        ),),
    );
  }
}
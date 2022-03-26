import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../api/api.dart';
import '../../models/user.dart';
import '../../util/color.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  /// 表单状态
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();
  FocusNode _focusNodePassWord2 = new FocusNode();
  FocusNode _focusNodePhone = new FocusNode();
  //控制器
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pwController2 = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isShowPwd = false;
  bool _isShowPwd2 = false;
  bool _isShowClear = false;

  bool _allowRegister = false;
  Map _userInfo = {};

  _addUserInfo(String username, String password, String phone) async {
    Uri apiUrl = Uri.parse(API.registerAPI);
    print(apiUrl);
    var map = new Map<String, dynamic>();
    map['username'] = username;
    map['role_id'] = "1";
    map['password'] = password;
    map['phone'] = phone;

    var response = await http.post(apiUrl, body: map,);
    if (response.statusCode == 200) {
      try {
        setState(() {
          if (json.decode(response.body)["id"] != null) {
            _userInfo = json.decode(response.body);
            _allowRegister = true;
          } else {
            _allowRegister = false;
          }
        });
      } catch (error) {
        _allowRegister = false;
      }
    } else {
      print(response.statusCode);
    }
  }

  _doRegister(String username, String password, String phone) async {
    // await getLoginId().then((String userId) {
    //   this.userId = userId;
    // });
    await _addUserInfo(username, password, phone);
    if (_allowRegister == true) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("注册成功"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.pop(context);
                    Navigator.popAndPushNamed(context, "/");
                  },
                  child: const Text("确定")),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("注册失败"),
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
    _focusNodePassWord2.addListener(_focusNodeListener);

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
    _pwController2.dispose();
    _phoneController.dispose();
    // 移除焦点监听
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    _focusNodePassWord2.removeListener(_focusNodeListener);
    _focusNodePhone.removeListener(_focusNodeListener);
    super.dispose();
  }

  // 监听焦点
  Future _focusNodeListener() async{
    if(_focusNodeUserName.hasFocus){
      print("用户名框获取焦点");
      // 取消密码框,重复密码框的焦点状态
      _focusNodePassWord.unfocus();
      _focusNodePassWord2.unfocus();
      _focusNodePhone.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框，重复密码框焦点状态
      _focusNodeUserName.unfocus();
      _focusNodePassWord2.unfocus();
      _focusNodePhone.unfocus();
    }
    if(_focusNodePassWord2.hasFocus){
      print("密码框获取焦点");
      // 取消用户名框，密码框焦点状态
      _focusNodeUserName.unfocus();
      _focusNodePassWord.unfocus();
      _focusNodePhone.unfocus();
    }
    if(_focusNodePhone.hasFocus){
      print("手机获取焦点");
      // 取消用户名框，密码框焦点状态
      _focusNodeUserName.unfocus();
      _focusNodePassWord.unfocus();
      _focusNodePassWord2.unfocus();
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

  /// 验证手机号码
  String? _validatePhone(value){
    RegExp exp = RegExp(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if (value.isEmpty) {
      return '手机号码不能为空';
    }
    else if (!exp.hasMatch(value)) {
      return '请输入正确手机号';
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
  String? _validatePassWord2(value){
    if (value.isEmpty) {
      return '请重复输入密码';
    }else if(value != _pwController2.text){
      return '两次密码输入不同';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(
            left: 35,
            top: 20,
            right: 35
        ),
        child: Form(
          key: _formKey,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ///文字简介
              const Text(
              "注 册",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF002251),
                    letterSpacing: 0,
                    fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "欢迎来到毕业生噩梦岛",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF7A869A),
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400
                ),
              ),
              const SizedBox(height: 4,),
              ///用户名输入框
              TextFormField(
                controller: _nameController,
                focusNode: _focusNodeUserName,
                decoration: InputDecoration(
                  hintText: '请输入用户名',
                  labelText: '用户名',
                    suffixIcon: _nameController.text.isNotEmpty ? IconButton(
                        onPressed: () {
                          _nameController.clear();
                      },
                      icon: const Icon(Icons.cancel)) : null
                ),
                // onSaved: (String? value) {
                //   _username = value.toString();
                // },
                validator: _validateUserName,
              ),
              const SizedBox(height: 4,),
              ///手机号码输入框
              TextFormField(
                controller: _phoneController,
                focusNode: _focusNodePhone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: '请输入手机号码',
                    labelText: '手机号',
                    suffixIcon: _phoneController.text.isNotEmpty ? IconButton(
                        onPressed: () {
                          _phoneController.clear();
                        },
                        icon: const Icon(Icons.cancel)) : null
                ),
                // onSaved: (String? value) {
                //   _username = value.toString();
                // },
                validator: _validatePhone,
              ),
              const SizedBox(height: 4,),
              ///密码输入框
              TextFormField(
                controller: _pwController,
                focusNode: _focusNodePassWord,
                obscureText: !_isShowPwd,
                decoration: InputDecoration(
                  hintText: '请输入密码',
                  labelText: '密码',
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
                validator: _validatePassWord,
              ),
              const SizedBox(height: 4),
              ///重复输入密码框
              TextFormField(
                controller: _pwController2,
                focusNode: _focusNodePassWord2,
                obscureText: !_isShowPwd2,
                decoration: InputDecoration(
                  hintText: '请重复输入密码',
                  labelText: '重复输入密码',
                    suffixIcon: IconButton(
                      icon: Icon((_isShowPwd2) ? Icons.visibility : Icons.visibility_off),
                      // 点击改变显示或隐藏密码
                      onPressed: (){
                        setState(() {
                          _isShowPwd2 = !_isShowPwd2;
                        });
                      },
                    )
                ),
                validator: _validatePassWord2,
              ),
              const SizedBox(height: 18),
              ///注册按钮
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(loginColor),
                    textStyle: MaterialStateProperty.all(const TextStyle(color: nav)),
                  ),
                  onPressed: () async {
                    _focusNodePassWord.unfocus();
                    _focusNodeUserName.unfocus();
                    _focusNodePassWord2.unfocus();
                    _focusNodePhone.unfocus();

                    if(_formKey.currentState!.validate()){
                      // _formKey.currentState!.save();

                      _doRegister(_nameController.text, _pwController.text, _phoneController.text);
                    }

                  },
                  child: const Text("注 册"),
                ),
              ),
              const SizedBox(height: 5),
              ///已有帐号
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("已有账号?", style: TextStyle(
                      color: Color(0xFF7A869A),
                      fontSize: 14,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400
                  ),),
                  TextButton(
                      child: const Text(
                        "立即登录",
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
        ),),),
      );
  }
}

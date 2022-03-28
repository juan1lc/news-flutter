import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/page/profiles/myself.dart';
import 'package:provider/provider.dart';

import '../../../api/api.dart';
import '../../../provider/user_info.dart';
import '../../../util/color.dart';
import '../../../util/color.dart';

class EditName extends StatefulWidget {
  const EditName({Key? key, required this.id, required this.username}) : super(key: key);

  //final Map arguments;
  final String id, username;
  @override
  _EditNameState createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {

  /// 表单状态
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //控制器
  TextEditingController _nameController = TextEditingController();

  String _message="fail";

  _updateUser(String id, String columnValue) async {
    Uri apiUrl = Uri.parse(API.updateUserInfo);
    print(widget.id);
    print(apiUrl);
    var response = await http.put(apiUrl, body: {"id":id,
      "columnName": 'userName', "columnValue":columnValue});
    if (response.statusCode == 200) {
      //print(json.decode(result.body));
      setState(() {
        if (json.decode(response.body) != null) {
          this._message="success";
          print("success");
        } else {
          this._message="fail";
          print("fail");
        }
      });
    } else {
      print(response.statusCode);
    }

  }

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    // 移除焦点监听
    super.dispose();
  }

  /// 验证新用户名
  String? _validateUserName(value){
    if (value.isEmpty) {
      return '用户名不能为空';
    }
    else if(value.trim().toString().length < 2 || value.trim().toString().length>64){
      return '用户名长度在2~64个字符之间';
    }
    else if(value==widget.username){
      return '新用户名不能于旧用户名相等';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black87,
        title: const Text("修 改 昵 称"),
        titleTextStyle: const TextStyle(
            color: loginColor,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),
        backgroundColor: primary,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget> [
              const SizedBox(height: 10,),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: widget.username,
                ),
                validator: _validateUserName,
              ),
              const SizedBox(height: 10,),
              const Text("2-64个字符，支持中英文、数字"),
              const SizedBox(height: 20,),
            FractionallySizedBox(
              widthFactor: 1,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(loginColor),
                  textStyle: MaterialStateProperty.all(TextStyle(color: nav)),
                ),
                onPressed: () async{
                  if(_formKey.currentState!.validate()){
                    await _updateUser(widget.id, _nameController.text);
                    if (_message == "success") {
                      UserInfoProvider userInfoProvider = Provider.of<UserInfoProvider>(context,listen: false);
                      userInfoProvider.updateInfo("username", _nameController.text);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyselfPage()),);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("提示"),
                            content: const Text("修改失败"),
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
                },
                child: const Text("确 定"),
              ),),
          ],
          ),
        ),
      ),
    );
  }
}

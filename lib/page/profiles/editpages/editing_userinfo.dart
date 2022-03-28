import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/page/profiles/editpages/edit_name.dart';
import 'package:news_app/page/profiles/editpages/editing_head.dart';
import 'package:provider/provider.dart';

import '../../../api/api.dart';
import '../../../models/user.dart';
import '../../../provider/user_info.dart';
import '../../../util/color.dart';

class UserInfoEditing extends StatefulWidget {
  const UserInfoEditing({Key? key, required this.userInfo}) : super(key: key);
  final User userInfo;

  @override
  _UserInfoEditingState createState() => _UserInfoEditingState();
}

class _UserInfoEditingState extends State<UserInfoEditing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        foregroundColor: Colors.black87,
        title: const Text("编 辑 资 料"),
        titleTextStyle: const TextStyle(
            color: loginColor,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            EditingHead(avatar: widget.userInfo.photo!, id: widget.userInfo.id,),
            const SizedBox(height: 2,),
            Container(
              padding: const EdgeInsets.only(top: 4, left: 5, bottom: 4),
                child: Row(
                  children: const [
                    Icon(Icons.drive_file_rename_outline, color: loginColor,),
                    SizedBox(width: 5,),
                    Text("账号信息", style: TextStyle(color: Colors.black87),),
                  ],
                )
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: nav,
              ),
              child: Column(
                children: <Widget>[
                  _InfomationUnit(title: "昵称", columnName: 'username',
                    columnValue: widget.userInfo.username, userInfo: widget.userInfo,),
                  _InfomationUnit(title: "性别", columnName: 'gender',
                    columnValue: widget.userInfo.gender.toString(), userInfo: widget.userInfo,),
                  _InfomationUnit(title: "生日", columnName: 'birth',
                    columnValue: widget.userInfo.birth.toString(), userInfo: widget.userInfo,),
                  _InfomationUnit(title: "简介", columnName: 'introduction',
                    columnValue: widget.userInfo.introduction.toString(), userInfo: widget.userInfo,),
                  _InfomationUnit(title: "手机", columnName: 'phone',
                    columnValue: widget.userInfo.phone.toString(), userInfo: widget.userInfo,),
                  _InfomationUnit(title: "邮箱", columnName: 'mail',
                    columnValue: widget.userInfo.mail.toString(), userInfo: widget.userInfo,),
                  _InfomationUnit(title: "地址", columnName: 'address',
                    columnValue: widget.userInfo.address.toString(), userInfo: widget.userInfo,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class _InfomationUnit extends StatelessWidget {
  const _InfomationUnit({
    Key? key,
    required this.title,
    required this.columnName,
    required this.columnValue,
    required this.userInfo
    })
      : super(key: key);

  final String title, columnName, columnValue;
  final User userInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 5),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black38),
            // top: BorderSide(width: 0.5, color: Colors.black45)
        )
      ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget> [
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
            const SizedBox(width: 30,),
            Text(columnValue, style: const TextStyle(fontSize: 16),),
            const Spacer(),
            IconButton(
              onPressed:(){
                if(title == "地址" || title == "邮箱" || title == "手机" || title == '简介') {
                  _editAddressMailPhoneIntro(context,title, userInfo.id, columnName, columnValue);
                } else if(title == "性别") {
                  _editGender(context, userInfo.id);
                } else if(title == '生日') {
                  _editBirth(context, userInfo.id);
                } else if(title == "昵称") {
                  Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                    EditName(id: userInfo.id, username: userInfo.username)),
                );}
                },
                icon: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 25,
                  color: Colors.grey,
                ),
            ),
          ],
        )
    );
  }
}

Future<dynamic> _editGender(BuildContext context, String id){
  return showModalBottomSheet(context: context,
      //自定义底部弹窗布局
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)),
      ),
      backgroundColor: primary,
      builder: (BuildContext context){
        return Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          height: 220,
          child: Column(
            children: <Widget>[
              const Icon(Icons.horizontal_rule, color: Colors.black45, size: 26,),
              const Text("性别修改",style: TextStyle(color: Colors.black45, fontSize: 16)),
              const SizedBox(height: 5,),
              FractionallySizedBox(
                widthFactor: 1,
                child: TextButton(
                    onPressed: ()async{
                      await _updateUser(id, 'gender', 'MALE');
                      if (_message == "success") {
                        UserInfoProvider userInfoProvider = Provider.of<UserInfoProvider>(context,listen: false);
                        userInfoProvider.updateInfo('gender', '男');
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("提示"),
                              content: const Text("修改成功"),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                          UserInfoEditing(userInfo: userInfoProvider.loginUser)),);
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
                    },
                    child: const Text("男",style: TextStyle(color: Colors.black87, fontSize: 16))
                ),
              ),
              const SizedBox(height: 5,),
              FractionallySizedBox(
                widthFactor: 1,
                child: TextButton(
                    onPressed: ()async{
                      await _updateUser(id, 'gender', 'FEMALE');
                      if (_message == "success") {
                        UserInfoProvider userInfoProvider = Provider.of<UserInfoProvider>(context,listen: false);
                        userInfoProvider.updateInfo('gender', '女');
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("提示"),
                              content: const Text("修改成功"),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                          UserInfoEditing(userInfo: userInfoProvider.loginUser)),);
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

                    }, child: const Text("女",style: TextStyle(color: Colors.black87, fontSize: 16),)
                ),
              ),
              const SizedBox(height: 5,),
              FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(page),
                      textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black)),
                    ),
                    onPressed: () { Navigator.pop(context); },
                    child: const Text("取 消", style: TextStyle(color: Colors.black87),),
                  )
              ),
            ],
          ),
        );
      });
}

Future<dynamic> _editBirth(BuildContext context, String id){
  var _dateTime = DateTime.now();
  return showModalBottomSheet(context: context,
  //自定义底部弹窗布局
  shape: const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
  topLeft: Radius.circular(10),
  topRight: Radius.circular(10)),
  ),
  backgroundColor: primary,
  builder: (BuildContext context){
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 260,
      child: Column(
        children: <Widget> [
          Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5, color: Colors.black))
            ),
            child: Row(
              children: <Widget> [
                TextButton(onPressed: (){Navigator.pop(context);},
                    child: const Text("取消",
                      style: TextStyle(color: Colors.black87, fontSize: 16),)
                ),
                const Spacer(),
                TextButton(onPressed: ()async{
                  String _birthDay = _dateTime.year.toString()+'-'+
                      _dateTime.month.toString()+'-'+_dateTime.day.toString();
                  await _updateUser(id, 'birth', _birthDay);
                  if (_message == "success") {
                    UserInfoProvider userInfoProvider = Provider.of<UserInfoProvider>(context,listen: false);
                    userInfoProvider.updateInfo('birth', _birthDay);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("提示"),
                          content: const Text("修改成功"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                      UserInfoEditing(userInfo: userInfoProvider.loginUser)),);
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

                },
                    child: const Text("确定",
                      style: TextStyle(color: Colors.black87, fontSize: 16),)
                ),
        ],
        ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              maximumDate: DateTime.now().add(const Duration(days: 1)),
              initialDateTime: _dateTime, onDateTimeChanged: (DateTime value) {
                _dateTime = value;
            },
            ),
          )
      ],
      ),
    );
  }
  );
}

Future<dynamic> _editAddressMailPhoneIntro(BuildContext context, String title, String id,
    String columnName, String columnValue){

  print (columnValue);
  print (columnName);

  /// 表单状态
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();

  return showModalBottomSheet(context: context,
  //自定义底部弹窗布局
  shape: const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10)),
  ), isScrollControlled: true,
  backgroundColor: primary,
  builder: (BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets, // 我们可以根据这个获取需要的padding
      duration: const Duration(milliseconds: 100),
      child: Form(
        key: _formKey,
        child: Container(
          height: 200,
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: <Widget> [
              Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.5, color: Colors.black))
                ),
                child: Row(
                  children: <Widget> [
                    TextButton(onPressed: (){Navigator.pop(context);},
                        child: const Text("取消",
                          style: TextStyle(color: Colors.black87, fontSize: 16),)
                    ),
                    const Spacer(),
                    Center(child: Text("编辑"+title,
                      style: const TextStyle(color: Colors.black87, fontSize: 16),)),
                    const Spacer(),
                    TextButton(onPressed: ()async{
                      await _updateUser(id, columnName, _textController.text);
                      if (_message == "success") {
                        UserInfoProvider userInfoProvider = Provider.of<UserInfoProvider>(context,listen: false);
                        userInfoProvider.updateInfo(columnName, _textController.text);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("提示"),
                              content: const Text("修改成功"),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                          UserInfoEditing(userInfo: userInfoProvider.loginUser)),);
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
                      },
                        child: const Text("确定",
                          style: TextStyle(color: Colors.black87, fontSize: 16),)
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _textController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: columnValue,
                ),
              )
            ],
          ),
        ),
      ),
    );}
  );
}

String _message="fail";

_updateUser(String id, String columnName, String columnValue) async {
  Uri apiUrl = Uri.parse(API.updateUserInfo);

  var response = await http.put(apiUrl, body: {"id":id,
    "columnName": columnName, "columnValue":columnValue});
  if (response.statusCode == 200) {
    //print(json.decode(result.body));
    if (json.decode(response.body) != null) {
        _message="success";
        print("success");
      } else {
        _message="fail";
        print("fail");
      }
    ;
  } else {
    print(response.statusCode);
  }

}
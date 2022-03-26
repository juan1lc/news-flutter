
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/page/profiles/editpages/edit_name.dart';
import 'package:news_app/page/profiles/editpages/editing_head.dart';

import '../../../util/color.dart';

class UserInfoEditing extends StatefulWidget {
  const UserInfoEditing({Key? key}) : super(key: key);

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
            EditingHead(avatar: "assets/images/avatar0.jpg"),
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
                  _InfomationUnit(title: "昵称", content: "刘宇", route: "/editName"),
                  _InfomationUnit(title: "性别", content: "男", route: "/"),
                  _InfomationUnit(title: "生日", content: "2000-08-24", route: "/"),
                  _InfomationUnit(title: "简介", content: "此用户很懒，暂时没有介绍...", route: "/"),
                  _InfomationUnit(title: "手机", content: "11011011011", route: "/"),
                  _InfomationUnit(title: "邮箱", content: "空", route: "/"),
                  _InfomationUnit(title: "地址", content: "广东广州", route: "/"),
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
    required this.content,
    required this.route,
    })
      : super(key: key);

  final String title, content, route;

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
            Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
            SizedBox(width: 30,),
            Text(content, style: TextStyle(fontSize: 16),),
            Spacer(),
            IconButton(
              onPressed:(){_editAddress(context,"地址", "广东广州");},
                icon: Icon(
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

Future<dynamic> _editGender(BuildContext context){
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
              Icon(Icons.horizontal_rule, color: Colors.black45, size: 26,),
              Text("性别修改",style: TextStyle(color: Colors.black45, fontSize: 16)),
              SizedBox(height: 5,),
              FractionallySizedBox(
                widthFactor: 1,
                child: TextButton(
                    onPressed: (){}, child: Text("男",style: TextStyle(color: Colors.black87, fontSize: 16))
                ),
              ),
              SizedBox(height: 5,),
              FractionallySizedBox(
                widthFactor: 1,
                child: TextButton(
                    onPressed: (){}, child: Text("女",style: TextStyle(color: Colors.black87, fontSize: 16),)
                ),
              ),
              SizedBox(height: 5,),
              FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(page),
                      textStyle: MaterialStateProperty.all(TextStyle(color: Colors.black)),
                    ),
                    onPressed: () { Navigator.pop(context); },
                    child: Text("取 消", style: TextStyle(color: Colors.black87),),
                  )
              ),
            ],
          ),
        );
      });
}

Future<dynamic> _editBirth(BuildContext context){
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
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5, color: Colors.black))
            ),
            child: Row(
              children: <Widget> [
                TextButton(onPressed: (){Navigator.pop(context);},
                    child: Text("取消",
                      style: TextStyle(color: Colors.black87, fontSize: 16),)
                ),
                Spacer(),
                TextButton(onPressed: (){Navigator.pop(context);},
                    child: Text("确定",
                      style: TextStyle(color: Colors.black87, fontSize: 16),)
                ),
        ],
        ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              maximumDate: DateTime.now().add(Duration(days: 1)),
              initialDateTime: _dateTime, onDateTimeChanged: (DateTime value) {  },
              // onDateTimeChanged: (date) {
              //   setState(() {
              //     _dateTime = date;
              //   });
              // },
            ),
          )
      ],
      ),
    );
  }
  );
}

Future<dynamic> _editAddress(BuildContext context, String argumenthint, String arguement){
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
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget> [
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.5, color: Colors.black))
              ),
              child: Row(
                children: <Widget> [
                  TextButton(onPressed: (){Navigator.pop(context);},
                      child: Text("取消",
                        style: TextStyle(color: Colors.black87, fontSize: 16),)
                  ),
                  Spacer(),
                  Center(child: Text("编辑"+argumenthint,
                    style: TextStyle(color: Colors.black87, fontSize: 16),)),
                  Spacer(),
                  TextButton(onPressed: (){Navigator.pop(context);},
                      child: Text("确定",
                        style: TextStyle(color: Colors.black87, fontSize: 16),)
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: arguement,
              ),
            )
          ],
        ),
      ),
    );}
  );
}

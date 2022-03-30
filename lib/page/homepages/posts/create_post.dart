import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/page/homepages/tag/tag_list.dart';
import 'package:news_app/provider/user_info_provider.dart';
import 'package:news_app/util/color.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../api/api.dart';
import '../../../models/user.dart';

class CreatePage extends StatefulWidget{
  const CreatePage({Key? key, this.tag, this.pre_content}) : super(key: key);

  final String? tag, pre_content;
  @override
  _CreatePage createState() => _CreatePage();
}


class _CreatePage extends State<CreatePage>{
  User? userInfo;
  String? content;

  /// 表单状态
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  /// 控制器
  final TextEditingController _textEditingController = TextEditingController();

  void initState(){
    super.initState();
    if(widget.pre_content!=null) {content=widget.pre_content;
    _textEditingController.text = content!;}
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<UserInfoProvider>(
      builder: (context, loginProvider, child){
        bool isLogin = loginProvider.isLogin; // Test use
        print('登录状态：isLogin=' + isLogin.toString());

        if(isLogin) userInfo = loginProvider.loginUser;


        return Scaffold(

            appBar: AppBar(
              centerTitle: true,
              title: _CreateHead(id: userInfo!.id,username: userInfo!.username,
                  content:content, tag: widget.tag,),
              foregroundColor: active,
              backgroundColor: primary,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Form(
                      child: TextFormField(
                        controller: _textEditingController,
                        maxLength: 255,
                        keyboardType: TextInputType.text,
                        maxLines: 20,
                        onChanged: (value){
                          content = value;

                          setState(() {
                            content = value;
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,//去掉输入框的下滑线
                          fillColor: nav,
                          filled: true,
                          hintText: '分享你的生活动态...',
                          // border: OutlineInputBorder(
                          //     borderRadius:BorderRadius.circular(4)
                          // ),
                        ),
                      ),
                  ),
                  (widget.tag!=null)? TextButton(
                      onPressed: (){}, child: Text('# '+widget.tag.toString(),
                      style:TextStyle(
                        color: loginColor
                      ))
                  ):TextButton(
                      onPressed: (){
                        var nav = Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>TagList(pre_content: content,))
                        );
                      }, child: Text('点击添加标签',
                      style:TextStyle(
                          color: loginColor
                      ))
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconContainer(Icons.tag, "添加标签", pre_content: content,),
                      IconContainer(Icons.perm_media, "选择图片"),
                      IconContainer(Icons.alternate_email, "艾特朋友")
                    ],
                  )
                ],
              ),
            )
        );
      }

    );
  }

}

class IconContainer extends StatelessWidget {
  final IconData iconImage;
  final String iconName;
  final String? pre_content;
  IconContainer(this.iconImage, this.iconName
  , {Key? key, this.pre_content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('precontent'+pre_content.toString());
    return Container(
        height: 80,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  this.iconImage,
                  size: 25,
                  color: Colors.grey,
                ),
                onPressed: () {
                  if(iconName == "添加标签") {
                    var nav = Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>TagList(pre_content: pre_content,))
                    );
                    // nav.then((val)=> tag=val);

                  }
                }
                ),
            // Text(this.iconName,
            //     style: TextStyle(fontSize: 13, color: Colors.grey))
          ],
        ));
  }
}

class _CreateHead extends StatelessWidget {
  _CreateHead({Key? key, required this.id, required this.username,
    this.content, this.tag})
      : super(key: key);

  final String id, username;
  final String? content, tag;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ListTile(
              title: const Center(child: Text("发布动态", style: TextStyle(fontSize: 18),)),
              subtitle: Center(child: Text(username, style: TextStyle(fontSize: 14),)),
            )
        ),
        ElevatedButton(
            onPressed: (content!=null)?()async{
              print('content:' + content.toString());
              _doPublish(context, id, content!, tag);
            }:null,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(loginColor),
              textStyle: MaterialStateProperty.all(const TextStyle(color: nav)),
            ),
            child: const Text("发布")
        )
      ],
    );
  }

  String _message='fail';

  _addPost(String userId, String content, String? tag)async{
    Uri apiUrl = Uri.parse((API.publishPost));
    print(apiUrl);
    var request = http.MultipartRequest("POST", apiUrl);
    request.fields['userId'] = userId;
    request.fields['content'] = content;
    request.fields['isrepost'] = "false";
    request.fields['postLike'] = "0";
    request.fields['postBrowse'] = "0";
    request.fields['commentCount'] = "0";
    request.fields['postStatus'] = "0";
    request.fields['location'] = "广东广州";
    if(tag!=null) request.fields['tags']=tag;
    print(request);
    // request.fields['createTime'] = DateTime.now().year.toString() + '-'
    // +DateTime.now().month.toString()+ '-' + DateTime.now().day.toString();
    // request.fields['updateTime'] = DateTime.now().year.toString() + '-'
    //     +DateTime.now().month.toString()+ '-' + DateTime.now().day.toString();
    var response = await request.send();

    if (response.statusCode == 200) {
      try {
        // if (json.decode(response.body)["author"] != null) {
        //     print(json.decode(response.body));
        //     _message = 'success';
        // } else {
        //     _message = 'fail';
        // }
        _message = 'success';
      } catch (error) {
        _message = 'fail';
      }
    } else {
      print(response.statusCode);
    }
  }

  _doPublish(BuildContext context, String userId, String content, String? tag) async{
    await _addPost(userId, content, tag);
    if(_message == 'success'){
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("发布成功"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    // Navigator.popAndPushNamed(context, "/");
                  },
                  child: const Text("确定")),
            ],
          );
        },
      );
    }else{
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("发布失败"),
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
}

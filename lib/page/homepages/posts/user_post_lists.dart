import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/postCard.dart';
import 'package:news_app/page/favoritepages/post_preview.dart';
import 'package:news_app/page/homepages/posts/post_preview.dart';

import '../../../models/user.dart';
import '../../../provider/user_info_provider.dart';
import '../../../util/color.dart';

class UserPostList extends StatefulWidget {
  const UserPostList({Key? key, required this.userid}) : super(key: key);
  final String userid;

  @override
  _UserPostListState createState() => _UserPostListState();
}

class _UserPostListState extends State<UserPostList> {
  User? user;
  List<dynamic> _list = [];
  List<PostCard> _postlist = [];
  bool _hasPost = false;

  void _getUserbyId(String userId) async {
    Uri apiUrl = Uri.parse(API.findUserById+'/'+userId);
    print(apiUrl);
    var response = await http.get(apiUrl);
    if(response.statusCode == 200){
      setState(() {
        user = User.fromJson(json.decode(response.body));
      });

    }else{
      print(response.statusCode);
    }
  }

  void _getUserPosts(String userId) async {
    Uri apiUrl = Uri.parse(API.getUserPosts+'/'+userId);

    var response = await http.get(apiUrl);
    if(response.statusCode == 200){
      setState(() {
        _list = json.decode(response.body);
        for(int i=0; i<_list.length; i++){
          _postlist.add(PostCard.fromJson(_list[i]));
        }
        if(_postlist.length>0) _hasPost=true;
      });
    }else{
      print(response.statusCode);
    }
  }

  @override
  initState(){

    super.initState();
    _getUserbyId(widget.userid);
    _getUserPosts(widget.userid);
  }

  @override
  Widget build(BuildContext context) {

    print('user'+ user.toString());
    return (user!=null)? Scaffold(
      // appBar: AppBar(
      //   title: Text(user!.username),
      //   centerTitle: true,
      //   titleTextStyle: const TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 16,
      //     letterSpacing: 1.5
      //   ),
      //   leading: IconButton(
      //     onPressed: (){Navigator.pop(context);},
      //     icon: const Icon(Icons.arrow_back_ios, color: Colors.grey,),
      //   ),
      //   backgroundColor: loginColor,
      //   foregroundColor: Colors.white,
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Scrollbar(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: const BoxDecoration(
                  color: loginColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  )
                ),
                child: Column(
                  children: <Widget> [
                    SizedBox(height: 60,),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: <Widget> [
                          CircleAvatar(
                            backgroundImage: AssetImage(user!.photo!),
                            radius: 40,
                          ),
                          SizedBox(width: 30,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(user!.username, style: TextStyle(
                                color: Colors.white, fontSize: 18, letterSpacing: 1.5
                              ),),
                              SizedBox(height: 5,),
                              (user!.introduction!=null)?
                                  Text(user!.introduction!, style: TextStyle(
                                      color: Colors.white70, fontSize: 15, letterSpacing: 1
                                  ),)
                                  :SizedBox(height: 0,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              (!_hasPost)? Container(
                decoration: const BoxDecoration(
                  color: primary,
                ),
                child: const Center(child: Text('没有动态'),),
              )
              :SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-190,
                  child: ListView.builder(
                      itemCount: _postlist.length,
                      //itemExtent: 200,
                      itemBuilder:(BuildContext context, int index){
                        return Column(
                          children: [
                            SizedBox(
                              width:MediaQuery.of(context).size.width,
                              //height: 200,
                              child: PostPreView(avatar: user!.photo!, username: user!.username,
                                  postCard: _postlist[index], userid: widget.userid,),
                            ),
                            SizedBox(height:5),
                          ],
                        );
                      }
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ):Scaffold(
      appBar: AppBar(
        title: const Text('动态'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: loginColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1.5
        ),
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey,),
        ),
        backgroundColor: page,
        foregroundColor: Colors.grey,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: primary,
        ),
        child: const Center(
          child: Text('无网络连接'),
        ),
      ),
    );
  }

  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print("3秒后输出");
    });
    return "";
  }
}



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/page/homepages/posts/create_post.dart';
import 'package:news_app/util/color.dart';
import 'package:http/http.dart' as http;

import '../../../api/api.dart';
import '../../../models/posts/postCard.dart';
import '../../../models/user.dart';

class DraftList extends StatefulWidget {
  const DraftList({Key? key, required this.userid}) : super(key: key);

  final String userid;
  @override
  _DraftListState createState() => _DraftListState();
}

class _DraftListState extends State<DraftList> {
  User? user;
  List<dynamic> _list = [];
  List<PostCard> _postlist = [];
  bool _hasDraft = false;
  bool _publish = false;

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

  _publishDraft(String postId) async {
    Uri apiUrl = Uri.parse(API.publishDrafts+'/'+postId);
    print(apiUrl);
    var response = await http.put(apiUrl);
    if(response.statusCode == 200){
      _publish=true;
      setState(() {
        _getUserDrafts(widget.userid);

      });

    }else{
      print(response.statusCode);
    }
  }

  void _getUserDrafts(String userId) async {
    Uri apiUrl = Uri.parse(API.getUserDrafts+'/'+userId);

    var response = await http.get(apiUrl);
    if(response.statusCode == 200){
      setState(() {
        _list = json.decode(response.body);
        for(int i=0; i<_list.length; i++){
          _postlist.add(PostCard.fromJson(_list[i]));
        }
        if(_postlist.length>0) _hasDraft=true;
      });
    }else{
      print(response.statusCode);
    }
  }

  @override
  initState(){

    super.initState();
    _getUserbyId(widget.userid);
    _getUserDrafts(widget.userid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: const Text('草稿箱'),
        titleTextStyle: const TextStyle(
            color: loginColor,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),
        centerTitle: true,
        backgroundColor: primary,
        actions: [
          TextButton(onPressed: (){},
              child: const Text('编辑', style: TextStyle(color: Colors.black87),))
        ],
      ),
      body: (user==null || _postlist.length==0)? Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(child: Text('暂无数据'),),
      ):Container(
        width: double.infinity,
        height: double.infinity,
        child: Scrollbar(
          child: ListView.builder(
            itemCount: _postlist.length,
            itemBuilder: (BuildContext context, int index){
              return InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>CreatePage(
                            tag: _postlist[index].tags,
                            pre_content: _postlist[index].content,
                          )
                      ));
                },
                child: Container(
                  width:MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: primary
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('动态',
                                style: TextStyle(fontSize: 16, color: Colors.black87),),
                              const SizedBox(height: 3,),
                              Text(_postlist[index].updateTime.toString(),
                                style: const TextStyle(fontSize: 15, color: Colors.black45),),
                            ],
                          ),
                          const Spacer(),
                          OutlinedButton(
                              onPressed: () async {
                            await _publishDraft(_postlist[index].id);
                            if(_publish){
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
                              child: const Text('重发', style: TextStyle(color: Colors.black45),))
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text(_postlist[index].content,
                        style: const TextStyle(fontSize: 24, color: Colors.black87),)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/util/color.dart';

import 'package:http/http.dart' as http;
import '../../../api/api.dart';
import '../../../models/tag.dart';
import '../posts/create_post.dart';

class TagList extends StatefulWidget {
  const TagList({Key? key, this.pre_content}) : super(key: key);

  final String? pre_content;
  @override
  _TagListState createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  late String? tag;
  List<dynamic> _list = [];
  List<String> _taglist = [];
  late ScrollController _controller;
  String _message = 'fail';

  _getAllTags()async{
    Uri apiUrl = Uri.parse(API.allTags);
    print(apiUrl);
    var response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      // print(json.decode(response.body));
      try {
        setState(() {
          _list = json.decode(response.body);
          print(_list);
          for(int i=0; i<_list.length; i++){
            _taglist.add(_list[i].toString());
          }
          print(_taglist);
          _message = 'success';
          // if (json.decode(response.body)["id"] != null) {
          //   _userInfo=User.fromJson(json.decode(response.body));
          //
          //   UserInfoProvider userInfoProvider = Provider.of<UserInfoProvider>(context,listen: false);
          //   userInfoProvider.doLogin(_userInfo);
          //   _message = 'success';
          // } else {
          //   _message = 'fail';
          // }
        });
      } catch (error) {
        _message = 'fail';
      }
    } else {
      _message = 'fail';
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
    _getAllTags();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('所 有 标 签'),
        titleTextStyle: TextStyle(
            color: loginColor,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),
        backgroundColor: page,
        foregroundColor: Colors.black87,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Scrollbar(
            //滑动指示器
            // child: RefreshIndicator(  ///下拉刷新控件
            //   child: ListView(//listview
            //     children: _list.map((e) => Text(e.toString())).toList(),
            //     //shrinkWrap: true,//滑到顶端时是否可以再往上滑动
            //     //reverse: true,  //数据反向展示    本来是1-99   改为true是  展示为99-1
            //     itemExtent: 50,   //设置每个item的高度
            //   ),onRefresh: _onRefresh,//下拉刷新执行此方法
            // ),
            child: _taglist.length>0?RefreshIndicator(
                child: ListView.builder(
                  itemExtent: 55,
                  // scrollDirection: Axis.horizontal,//设置为水平布局
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: primary,
                        shape: BoxShape.rectangle,
                        border: Border(bottom:
                          BorderSide(width: 0.5, color: Colors.black38),)
                      ),
                      child: InkWell(
                        onTap: (){
                          tag = _list[index];
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder:
                                  (context)=>CreatePage(
                                      tag:tag, pre_content: widget.pre_content,)
                              ));
                          },
                        child: Center(
                            child: Text('# '+_list[index]+' #', style: TextStyle(
                              fontSize: 18,
                            ),)
                        ),
                      ),
                    );
                  },
                  itemCount: _list.length,
                ),
                onRefresh: _onRefresh //下拉刷新执行此方法
            ): Center(
              child: Text('暂无数据'),
            )
          )),
    );
  }

  Future _onRefresh() async {
    //自定义方法执行下拉操作
    await Future.delayed(Duration(seconds: 3), () {
      print("3秒后输出");
    });
    return "";
  }
}

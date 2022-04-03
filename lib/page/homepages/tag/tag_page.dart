import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/postCard.dart';
import 'package:news_app/util/color.dart';

import '../../../models/postVo.dart';
import '../../../models/user.dart';
import '../posts/post_preview.dart';

class TagPage extends StatefulWidget {
  const TagPage({Key? key, required this.title,
    required this.desc, required this.img, this.userid}) : super(key: key);

  final String title, desc, img;
  final String? userid;
  @override
  _TagPageState createState() => _TagPageState();
}

List<Tab> _tabs = <Tab> [
  Tab(text:"热门动态"),
  Tab(text:"最新动态")
];
List<Widget>_tabContent=[
  const Text('热门'),
  const Text('实时')
];

class _TagPageState extends State<TagPage> with SingleTickerProviderStateMixin{
  List<dynamic> _list = [];
  List<PostVo> _postlist = [];

  bool _hasPost = false;


  void _getTagPosts(String title) async {
    print('title:$title');
    Uri apiUrl = Uri.parse(API.getTagLatestPosts+'?tag_name=$title');
    print(apiUrl);

    var response = await http.get(apiUrl);
    if(response.statusCode == 200){
      setState(() {
        _list = json.decode(response.body);
        print(json.decode(response.body));
        for(int i=0; i<_list.length; i++){
          _postlist.add(PostVo.fromJson(_list[i]));
        }
        print(_postlist);

        if(_postlist.length>0) _hasPost=true;
      });
    }else{
      print(response.statusCode);
    }
  }

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
    _getTagPosts(widget.title);
    _tabController.addListener(() {
      _tabController.index;
    });

    _tabContent=[
      const Text('热门'),
      TagPosts(postlist: _postlist, userid: widget.userid,)
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            _TagHead(title: widget.title, desc: widget.desc, img: widget.img,),
            SizedBox(height: 2,),
            Container(
              color: primary,
              child: TabBar(
                controller: _tabController,
                tabs: _tabs,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height-250,
              color: primary,
              child: TabBarView(
                controller: _tabController,
                  children: _tabContent
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _TagHead extends StatelessWidget {
  const _TagHead({Key? key, required this.title, required this.desc,
    required this.img}) : super(key: key);

  final String title, desc, img;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            color: loginColor,
          ),
          padding: const EdgeInsets.only(top: 120),
          child: Container(
            height: 80,
            decoration: const BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
          ),
        ),
        Column(
          children: <Widget> [
            SizedBox(height:80),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              padding: const EdgeInsets.only(left:20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Image.asset(img, fit: BoxFit.cover,),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget> [
                      Text('# '+title+' #', style: const TextStyle(
                        color: Colors.white, fontSize: 20
                      ),),
                      const SizedBox(height: 12,),
                      Text('导语：'+ desc, style: const TextStyle(
                          color: Colors.black87, fontSize: 16
                      ),),
                      const SizedBox(height: 5,),
                      const Text('讨论量：0', style: TextStyle(
                          color: Colors.black87, fontSize: 16
                      ),),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class TagPosts extends StatelessWidget {
  const TagPosts({Key? key, required this.postlist, this.userid}) : super(key: key);

  final List<PostVo> postlist;
  final String? userid;
  @override
  Widget build(BuildContext context) {
    return (postlist.length>0)?
    Container(
      width: double.infinity,
      height: double.infinity,
      child: Scrollbar(
        child:ListView.builder(
            itemCount: postlist.length,
            itemBuilder: (BuildContext context, int index){

              return Column(
                children: [
                  SizedBox(
                    width:MediaQuery.of(context).size.width,

                    child: PostPreView(avatar: postlist[index].authorPhoto,
                      username: postlist[index].author, postCard: postlist[index].postCard, userid: userid,)
                  ),
                  const SizedBox(height:5),
                ],
              );
            }
        ),
      ),
    )
        :Container(
      width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text('暂无数据'),
        ),
    );
  }
}



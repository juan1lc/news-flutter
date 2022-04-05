import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/models/articles/articlePreview.dart';
import 'package:provider/provider.dart';

import '../../../api/api.dart';
import 'package:http/http.dart' as http;
import '../../../models/user.dart';
import '../../../provider/user_info_provider.dart';
import 'article_card.dart';



class ArticleList extends StatefulWidget {
  ArticleList({Key? key, required this.type_id}) : super(key: key);

  final String type_id;
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  List<dynamic> _list=[];
  List<ArticlePreview> _articlelist=[];
  bool _hasArticle = false;

  void _getArticles(String typeId) async {
    print(typeId);
    Uri apiUrl = Uri.parse(API.getAllArticles+'/$typeId');
    print(apiUrl);

    var response = await http.get(apiUrl);
    if(response.statusCode == 200){
      setState(() {
        _list = json.decode(response.body);

        for(int i=0; i<_list.length; i++){
          _articlelist.add(ArticlePreview.fromJson(_list[i]));
        }
        print(_articlelist[0]);

        if(_articlelist.length>0) _hasArticle=true;
      });
    }else{
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    _getArticles(widget.type_id);
  }

  User? userInfo;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInfoProvider>(
        builder: (context, loginProvider, child){
          bool isLogin = loginProvider.isLogin; // Test use

          if(isLogin) userInfo = loginProvider.loginUser;

          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: (_hasArticle)?SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int index){
                      return (isLogin)?ArticleCard(title: _articlelist[index].title,
                        introduction: _articlelist[index].introduction,
                        publisher: _articlelist[index].author,
                        publish_time: _articlelist[index].publishTime,
                        publisher_avatar: _articlelist[index].authorPhoto,
                        id: _articlelist[index].id,
                        userid: userInfo!.id,
                      ):ArticleCard(title: _articlelist[index].title,
                        introduction: _articlelist[index].introduction,
                        publisher: _articlelist[index].author,
                        publish_time: _articlelist[index].publishTime,
                        publisher_avatar: _articlelist[index].authorPhoto,
                        id: _articlelist[index].id,
                      );
                    }
                ),
              ):SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Center(
                    child: Text("加载中...")
                ),
              )
          );
        }
    );
  }

}

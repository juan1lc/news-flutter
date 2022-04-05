import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:news_app/models/articles/articleLikers.dart';
import 'package:news_app/provider/user_info_provider.dart';
import 'package:news_app/widget/ArticleLikers.dart';
import 'package:news_app/widget/Publisher.dart';
import 'package:provider/provider.dart';
import '../../../api/api.dart';
import '../../../models/articles/articleVo.dart';
import '../../../models/user.dart';
import '../../../util/color.dart';

class ArticleDetailPage extends StatefulWidget {
  const ArticleDetailPage({Key? key, required this.id, this.userid}) : super(key: key);

  final String id;
  final String? userid;
  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  ArticleVo? _articleVo;
  bool _success=false;
  bool _liked=false;
  List<dynamic> _list=[];
  List<ArticleLikers> _articleLikers=[];
  int likeNum=0;
  ArticleLikersView? _likersView;


  _checkLiked(String userId, String articleId) async {
    Uri apiUrl = Uri.parse(API.likeArticle+'/$articleId/$userId');
    print(apiUrl);
    var response = await http.get(apiUrl);
    if(response.statusCode == 200){
      setState(() {
        if(json.decode(response.body).toString()=='true') _liked = true;
        else _liked = false;
      });
    }else{
      print(response.statusCode);
    }
  }

  _likeArticle(String userId, String articleId) async {
    Uri apiUrl = Uri.parse(API.likeArticle);
    var map = new Map<String, dynamic>();
    map['userid'] = userId;
    map['articleid'] = articleId;

    var response = await http.post(apiUrl, body: map,);

    if (response.statusCode == 200){
      print(json.decode(response.body));
      setState(() {
        likeNum = json.decode(response.body);
      });
    }else{
      print(response.statusCode);
    }
  }

  _likeList(String articleId) async {
    List<ArticleLikers> _likers=[];
    Uri apiUrl = Uri.parse(API.articleLikers+'/$articleId');
    print(apiUrl);

    var response = await http.get(apiUrl);
    if(response.statusCode == 200){
      _list = json.decode(response.body);
      setState(() {
        for(int i=0; i<_list.length; i++){
          _likers.add(ArticleLikers.fromJson(_list[i]));
          _articleLikers = _likers;
        }
        print(_articleLikers);
        _likersView = ArticleLikersView(articleLikers: _likers,);
      });
    }else{
      print(response.statusCode);
    }
  }

  _getArticle(String id) async {
    Uri apiUrl = Uri.parse(API.getArticleDetail+'/$id');
    print(apiUrl);
    var response = await http.get(apiUrl);
    if(response.statusCode == 200){
      setState(() {
        print(json.decode(response.body));
        _articleVo = ArticleVo.fromJson(json.decode(response.body));
        if(_articleVo!=null) {
          _success=true;
          likeNum = _articleVo!.article.article_like;
        }
      });
    }else{
      print(response.statusCode);
    }
  }

  @override
  void initState(){
    super.initState();
    _getArticle(widget.id);
    if(_articleVo!=null) likeNum = _articleVo!.article.article_like;
    _likeList(widget.id);
    if(widget.userid!=null) _checkLiked(widget.userid!, widget.id);
  }

  User? _userInfo;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInfoProvider>(
        builder: (context, loginProvider, child){
          bool isLogin = loginProvider.isLogin;
          if(isLogin) _userInfo = loginProvider.loginUser;

          return Scaffold(
            appBar: AppBar(
              title: const Text('文章详情'),
              centerTitle: true,
              titleTextStyle: const TextStyle(
                  color: loginColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
              leading: IconButton(
                onPressed: (){Navigator.pop(context);},
                icon: const Icon(Icons.arrow_back_ios, color: Colors.grey,),
              ),
              actions: <Widget>[
                IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz)),
              ],
              backgroundColor: page,
              foregroundColor: Colors.black45,
            ),
            body: (!_success)? SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(child: Text('网络错误'),),
            ): MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget> [
                    Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget> [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(left:20, right: 20,
                                    top: 15, bottom: 15),
                                decoration: const BoxDecoration(
                                  color: primary,
                                ),
                                child: Scrollbar(
                                  child: Column(
                                    children: [
                                      Publisher(username: _articleVo!.author,
                                          avatar: _articleVo!.authorPhoto,
                                          publishTime: _articleVo!.article.publishTime),
                                      const SizedBox(height: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(_articleVo!.article.title,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold
                                              ),),
                                              const SizedBox(height: 20,),
                                              Text(_articleVo!.article.content,
                                                style: const TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500
                                                ),),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('文章来源：',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12
                                                ),),
                                              Text(_articleVo!.article.source.toString(),
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12
                                              ),),
                                              const SizedBox(width: 2,),
                                              Text('原文章发布时间：'+_articleVo!.article.original_time,
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12
                                                ),),
                                              const SizedBox(width: 2,),
                                              Text('作者：'+_articleVo!.author,
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12
                                                ),),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(left:20, right: 20, top: 10, bottom: 15),
                                decoration: const BoxDecoration(
                                  color: primary,
                                ),
                                child: Row(
                                  children: [
                                    InkWell(
                                        onTap: (){print('转发');},
                                        child: Text('转发 0', style: TextStyle(
                                            color: Colors.black87, fontSize: 15
                                        ),)),
                                    const SizedBox(width: 15,),
                                    InkWell(
                                        onTap: (){print('评论');},
                                        child: Text('评论 '+_articleVo!.article.comment_count.toString()
                                            , style: const TextStyle(
                                                color: Colors.black87, fontSize: 15
                                            ))),
                                    const Spacer(),
                                    InkWell(
                                        onTap: (){print('赞');},
                                        child: Text('赞 '+likeNum.toString()
                                            , style: const TextStyle(
                                                color: Colors.black87, fontSize: 15
                                            )
                                        )),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                child: (_articleLikers.isNotEmpty)? _likersView
                                :SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 300,
                                  child: const Center(
                                    child: Text('暂无数据'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: page,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(5),
                              topLeft: Radius.circular(5)
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45.withOpacity(0.4),
                                offset: Offset(0, -2.0), //阴影y轴偏移量
                                blurRadius: 20, //阴影模糊程度
                                spreadRadius: 3 //阴影扩散程度
                            )
                          ]
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: (){print('转发按钮');},
                            child: Row(
                              children: const [
                                Icon(Icons.repeat),
                                SizedBox(width: 4,),
                                Text('转发'),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){print('评论按钮');},
                            child: Row(
                              children: const [
                                Icon(Icons.comment_outlined),
                                SizedBox(width: 4,),
                                Text('评论'),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (_userInfo!=null)?()async{print('赞按钮');
                            await _likeArticle(_userInfo!.id, widget.id);
                            setState(() {
                              _liked = !_liked;
                              _likeList(widget.id);
                            });
                            }:(){
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("提示"),
                                    content: const Text("请先登录"),
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
                            },
                            child: Row(
                              children: [
                                (_liked == false)? Icon(Icons.thumb_up_alt_outlined, color: Colors.grey,)
                                    : Icon(Icons.thumb_up, color: loginColor,),
                                SizedBox(width: 4,),
                                Text('赞'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
          );
        }
    );
  }
}



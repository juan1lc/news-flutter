import 'package:flutter/material.dart';
import 'package:news_app/page/homepages/articles/article_list.dart';

import '../../util/color.dart';
import 'like_form.dart';

class FavoritePage extends StatefulWidget{
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePage createState() => _FavoritePage();
}

const List<Tab> _tabs = <Tab> [
  Tab(text: '动态'),
  Tab(text: '文章'),
  Tab(text: '关注'),
  Tab(text: '收藏'),
  Tab(text: '赞'),
];

final List<Widget> _tabContent = [
  const LikeForm(),
  ArticleList(type_id: "1"),
  ArticleList(type_id: "1"),
  ArticleList(type_id: "1"),
  ArticleList(type_id: "1"),
];

class _FavoritePage extends State<FavoritePage> with SingleTickerProviderStateMixin{
  String message = '我的关注';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);

    _tabController.addListener(() {
      _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('我 的 关 注'),
        titleTextStyle: TextStyle(
            color: loginColor,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),
        backgroundColor: primary,
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabContent,
      ),
    );
  }

}
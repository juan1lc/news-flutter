import 'package:flutter/material.dart';
import 'package:news_app/page/homepages/articles/article_list.dart';
import 'package:news_app/search/search.dart';

import '../../../util/color.dart';
import '../../../util/color.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

const List<Tab> _tabs = <Tab> [
  Tab(text: '推荐'),
  Tab(text: '考研'),
  Tab(text: '留学'),
  Tab(text: '考公'),
  Tab(text: '雅思'),
  Tab(text: '托福'),
  Tab(text: '视频')
];

final List<Widget> _tabContent = [
  const ArticleList(),
  const ArticleList(),
  const ArticleList(),
  const ArticleList(),
  const ArticleList(),
  const ArticleList(),
  const ArticleList(),
];

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin{

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
        backgroundColor: primary,
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
          isScrollable: true,
        ),
        title: const SearchHead(),
        centerTitle: true,
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabContent,
      ),
    );
  }

}
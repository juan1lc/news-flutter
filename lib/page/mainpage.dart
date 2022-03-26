import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/color.dart';
import 'homepages/posts/create_post.dart';
import 'homepages/posts/discuss_page.dart';
import 'favoritepages/favorite_page.dart';
import 'homepages/articles/home_page.dart';
import 'profiles/myself.dart';

List<Widget> pages = [
  const HomePage(),
  const FavoritePage(),
  const DiscussPage(),
  const MyselfPage(),
];

List<BottomNavigationBarItem> barItems = [
  const BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home), tooltip: ''),
  const BottomNavigationBarItem(label: '关注', icon: Icon(Icons.favorite), tooltip: ''),
  const BottomNavigationBarItem(label: '讨论', icon: Icon(Icons.free_breakfast), tooltip: ''),
  const BottomNavigationBarItem(label: '我的', icon: Icon(Icons.account_circle), tooltip: ''),

];

//发布按钮
Widget _floatCreateButtom(BuildContext context){
  return Container(
    width: 40,
    height: 40,
    margin: EdgeInsets.only(top: 55),

    child: FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: loginColor,
      mini: true,
      onPressed:(){Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new CreatePage()),
      );}
    ),
  );
}

void _onCreateButtom(BuildContext context){

}

class MainPage extends StatefulWidget{
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState()=> _MainPageState();

}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: barItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 18,
        unselectedFontSize: 16,
        iconSize: 24,

      ),
        floatingActionButton: _floatCreateButtom(context),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
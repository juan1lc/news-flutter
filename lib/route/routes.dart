import 'package:flutter/material.dart';
import 'package:news_app/page/homepages/posts/create_post.dart';

import '../page/homepages/articles/home_page.dart';
import '../page/profiles/editpages/edit_name.dart';
import '../page/profiles/editpages/editing_userinfo.dart';


//配置路由
final routes = {
  '/': (context) => const HomePage(),
  '/create':(context) => const CreatePage(),
  '/editingInfo':(context) => const UserInfoEditing(),
  'editName':(context, username, id) => EditName(username: username, id: id),
  //'/Login': (context, {arguments}) => Login(),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name] as Function;
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};

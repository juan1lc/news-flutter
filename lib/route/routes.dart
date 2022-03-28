import 'package:flutter/material.dart';
import 'package:news_app/page/homepages/posts/create_post.dart';
import 'package:news_app/page/loginpages/loginPage.dart';

import '../models/user.dart';
import '../page/homepages/articles/home_page.dart';
import '../page/profiles/editpages/edit_name.dart';
import '../page/profiles/editpages/editing_userinfo.dart';


//配置路由
final routes = {
  '/': (context) => const HomePage(),
  '/create':(context) => const CreatePage(),
  '/login':(context) => const LoginPage(),
  // '/editingInfo':(context,{arguments}) => UserInfoEditing(arguments:arguments),
  // '/editName':(context,{arguments}) => EditName(arguments:arguments),
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

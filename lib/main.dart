import 'package:flutter/material.dart';
import 'package:news_app/page/transit_page.dart';
import 'package:news_app/util/app_theme.dart';

void main() {
  runApp(const MyNewsApp());
}


class MyNewsApp extends StatelessWidget {
  const MyNewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'未来社区',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const TransitPage(),
      //home: const Login(),
    );
  }

}


import 'package:flutter/material.dart';
import 'package:news_app/util/color.dart';

class MyselfPage extends StatefulWidget{
  const MyselfPage({Key? key}) : super(key: key);

  @override
  _MyselfPage createState() => _MyselfPage();
}

class _MyselfPage extends State<MyselfPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('我的'),
        backgroundColor: primary,
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }

}
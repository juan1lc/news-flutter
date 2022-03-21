import 'package:flutter/material.dart';
import 'package:news_app/widget/Banner.dart';

import '../util/color.dart';

class DiscussPage extends StatefulWidget{
  const DiscussPage({Key? key}) : super(key: key);

  @override
  _DiscussPage createState() => _DiscussPage();
}

class _DiscussPage extends State<DiscussPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('讨论区'),
        backgroundColor: primary,
      ),
      body: const DiscussBanner(),
    );
  }

}
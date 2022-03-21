import 'package:flutter/material.dart';
import 'package:news_app/util/color.dart';
import 'package:news_app/widget/Banner.dart';

class CreatePage extends StatefulWidget{
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePage createState() => _CreatePage();
}

class _CreatePage extends State<CreatePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('发布'),
        foregroundColor: active,
        backgroundColor: primary,
      ),
      body: const DiscussBanner(),
    );
  }

}
import 'package:flutter/material.dart';

import '../util/color.dart';

class FavoritePage extends StatefulWidget{
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePage createState() => _FavoritePage();
}

class _FavoritePage extends State<FavoritePage>{
  String message = 'hello';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(message, style: const TextStyle(color:active),),
        backgroundColor: primary,
      ),
      body: const Center(
        child: Text('我的收藏页'),
      ),
    );
  }

}
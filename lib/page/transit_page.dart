import 'dart:async';

import 'package:flutter/material.dart';

import 'loginpages/loginPage.dart';
import 'mainpage.dart';

class TransitPage extends StatefulWidget {
  const TransitPage({Key? key}) : super(key: key);

  @override
  _TransitPageState createState() => _TransitPageState();
}

int _currentTime = 6;
late Timer _timer;
class _TransitPageState extends State<TransitPage> {
  @override
  void initState() {

    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentTime--;
      });
      if(_currentTime<=0) {
        _jumpRootPage();
      }
    });
  }

  //跳转首页
  void _jumpRootPage(){
    _timer.cancel();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(
          //builder: (BuildContext context)=>const MainPage(),
          builder: (BuildContext context)=>const LoginPage(),
        ),
            (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/tanspage.png',
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top +20,
            right: 10,
            child: InkWell( //处理点击事件
              child: _clipButton(),
              onTap: _jumpRootPage,
            ),
          )
        ],
      )
    );
  }
}
//跳过按钮
Widget _clipButton() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child:Container(
      width: 50,
      height: 50,
      color: Colors.black.withOpacity(0.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '跳过',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          Text(
            '${_currentTime}s',
            style: const TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ),
    ),
  );
}

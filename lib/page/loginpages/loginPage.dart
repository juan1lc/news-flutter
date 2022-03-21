import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/color.dart';
import 'loginForm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: loginColor,
        padding: const EdgeInsets.only(top: 126),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            children: <Widget>[
              TabBar(
                  controller: _tabController,
                  tabs: const <Widget>[Tab(text: "登录"), Tab(text: "注册")]),
              Flexible(
                flex: 1,
                child: TabBarView(
                  controller: _tabController,
                  children: const <Widget>[
                    LoginForm(),
                    Center(
                      child: Text("注册"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
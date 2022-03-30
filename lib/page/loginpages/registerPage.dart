import 'package:flutter/material.dart';
import 'package:news_app/page/loginpages/registerForm.dart';

import '../../util/color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  SingleChildScrollView(
          child: Container(
            color: loginColor,
            padding: const EdgeInsets.only(top: 155),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15), topRight: Radius.circular(15))),
              child: RegisterForm()
            ),
          ),
        )
    );
  }
}

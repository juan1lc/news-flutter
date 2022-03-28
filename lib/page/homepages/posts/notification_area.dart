import 'package:flutter/material.dart';

import '../../../util/color.dart';
import '../../loginpages/loginPage.dart';

class NotificationHead extends StatelessWidget {
  const NotificationHead({Key? key, required this.username,
    required this.avatar, required this.isLogin})
      : super(key: key);

  final String username, avatar;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now().hour;
    print(DateTime.now());
    String welcome='';
    if(now>=0 && now<4 || now >=23) welcome='夜深了';
    else if(now>=4 && now<8 ) welcome='早上好';
    else if(now>=8 && now<11) welcome='上午好';
    else if(now>=11 && now<2) welcome='中午好';
    else if(now>=2 && now<6) welcome='下午好';
    else welcome='晚上好';

    return isLogin? Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top:40),
            width: MediaQuery.of(context).size.width,
            height: 210,
            decoration: const BoxDecoration(
              color: loginColor,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(110)),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Column(
                    children: <Widget>[
                      Text(welcome, style: TextStyle (
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16),
                      ),
                      SizedBox(height: 5,),
                      Text(username, style: TextStyle (
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget> [
                      Icon(
                        Icons.notifications,
                        color: Colors.white.withOpacity(0.9),
                        size: 25,
                      ),
                      const SizedBox(width: 18,),
                      CircleAvatar(
                        backgroundImage: AssetImage(avatar),
                        radius: 22,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              child: Image(
                  width: MediaQuery.of(context).size.width,
                  height: 210,
                  image: const AssetImage('assets/images/bg.png')))
        ]
    ):InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top:40),
              width: MediaQuery.of(context).size.width,
              height: 210,
              decoration: const BoxDecoration(
                color: loginColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(110)),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Column(
                      children: <Widget>[
                        Text(welcome, style: TextStyle (
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16),
                        ),
                        SizedBox(height: 5,),
                        Text(username, style: TextStyle (
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundImage: AssetImage(avatar),
                      radius: 22,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                child: Image(
                    width: MediaQuery.of(context).size.width,
                    height: 210,
                    image: const AssetImage('assets/images/bg.png')))
          ]
      ),
    );
  }
}


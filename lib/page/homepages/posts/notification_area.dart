import 'package:flutter/material.dart';

import '../../../util/color.dart';

class NotificationHead extends StatelessWidget {
  const NotificationHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      Text("晚上好", style: TextStyle (
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16),
                      ),
                      SizedBox(height: 5,),
                      Text("刘 宇", style: TextStyle (
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
                        backgroundImage: AssetImage("assets/images/defaultAvatar.png"),
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
    );
  }
}


import 'package:flutter/material.dart';

import '../../../util/color.dart';

class EditingHead extends StatelessWidget {
  EditingHead({Key? key, required this.avatar}) : super(key: key);
  String avatar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget> [
        Container(
          padding: const EdgeInsets.only(top:5),
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: const BoxDecoration(
            color: loginColor,
          ),
          child: Container(
            padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                InkWell(
                  onTap: (){},
                  child: CircleAvatar(backgroundImage: AssetImage("assets/images/defaultAvatar.png"), radius: 40,),
                ),
                SizedBox(height: 5,),
                Text("点击头像可更换照片", style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            child: Image(
                width: MediaQuery.of(context).size.width,
                height: 150,
                fit: BoxFit.fitWidth,
                image: const AssetImage('assets/images/bg.png'))
        ),
      ],
    );
  }
}

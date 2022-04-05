import 'package:flutter/material.dart';

import '../util/color.dart';

class Publisher extends StatelessWidget {
  const Publisher({Key? key, required this.username,
    required this.avatar, required this.publishTime})
      : super(key: key);

  final String username, avatar, publishTime;

  @override
  Widget build(BuildContext context) {
    bool isPressed = false;
    return Row(
      children: <Widget> [
        CircleAvatar(backgroundImage: AssetImage(avatar), radius: 25,),
        const SizedBox(width: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(username, style: TextStyle(
                color: loginColor,fontSize: 20, letterSpacing: 1),),
            SizedBox(height: 4,),
            Text(publishTime)
          ],
        ),
        const Spacer(),
        IconButton(onPressed: (){
          isPressed = true;
          print('pressed');
        },
          icon: (!isPressed)? Icon(Icons.star_border, color: Colors.grey, )
              : Icon(Icons.star, color: Colors.yellow,),
        )
      ],
    );
  }
}
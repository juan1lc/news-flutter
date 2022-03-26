import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/page/homepages/posts/user_card.dart';
import 'package:news_app/util/color.dart';

class UserBanner extends StatelessWidget {
  const UserBanner({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:20),
       child: Column(
          children: <Widget> [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                Text(title,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
                Spacer(),
                TextButton(
                    onPressed: (){},
                    child: Text("更多",
                      style: TextStyle(color: loginColor,),
                    )
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              //padding: const EdgeInsets.only(left:20),
              child: Row(
                children: <Widget>[
                  UserCard(username: "刘宇", photo: 'assets/images/avatar0.jpg'),
                  UserCard(username: "刘宇", photo: 'assets/images/avatar1.jpg'),
                  UserCard(username: "刘宇", photo: 'assets/images/avatar2.jpg'),
                  UserCard(username: "刘宇", photo: 'assets/images/avatar3.jpg'),
                ]
              ),
            )
          ],
        )
    );
  }
}

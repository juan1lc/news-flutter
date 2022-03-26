import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.username, required this.photo}) : super(key: key);
  final String username, photo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: <Widget> [
          CircleAvatar(backgroundImage: AssetImage(photo), radius: 45,),
          SizedBox(height: 5,),
          Text(username)
        ],
      ),
    );
  }
}

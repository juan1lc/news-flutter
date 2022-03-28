import 'package:flutter/material.dart';

import '../util/color.dart';

class CreateHead extends StatefulWidget {
  const CreateHead({Key? key}) : super(key: key);

  @override
  _CreateHeadState createState() => _CreateHeadState();
}

class _CreateHeadState extends State<CreateHead> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ListTile(
              title: const Center(child: Text("发布动态", style: TextStyle(fontSize: 18),)),
              subtitle: Center(child: Text("用户昵称", style: TextStyle(fontSize: 14),)),
            )
        ),
        ElevatedButton(
            onPressed: (){},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(loginColor),
              textStyle: MaterialStateProperty.all(const TextStyle(color: nav)),
            ),
            child: const Text("发布")
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../util/color.dart';
import '../../../util/color.dart';

class EditName extends StatefulWidget {
  const EditName({Key? key, required this.username, required this.id}) : super(key: key);

  final String username, id;
  @override
  _EditNameState createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
  // String username, id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black87,
        title: Text("修 改 昵 称"),
        titleTextStyle: TextStyle(
            color: loginColor,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),
        backgroundColor: primary,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget> [
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: widget.username,
                  // labelText: widget.username,
              ),
            ),
            SizedBox(height: 10,),
            Text("2-64个字符，支持中英文、数字"),
            SizedBox(height: 20,),
          FractionallySizedBox(
            widthFactor: 1,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(loginColor),
                textStyle: MaterialStateProperty.all(TextStyle(color: nav)),
              ),
              onPressed: () {},
              child: const Text("确 定"),
            ),),
        ],
        ),
      ),
    );
  }
}

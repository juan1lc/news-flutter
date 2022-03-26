import 'package:flutter/material.dart';
import 'package:news_app/util/color.dart';

class SearchHead extends StatelessWidget {
  const SearchHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image.asset(
        //   'assets/images/logo2.png',
        //   height: 60,
        // ),
        Expanded(
            child: _searchContent(),
        ),
        OutlinedButton(
            onPressed: (){},
            child: const Text(
              "搜 索",
              style: TextStyle(color: loginColor, fontWeight: FontWeight.bold),
            ),

        )
        // Icon(Icons.search, color: loginColor,),
        // Image.asset(
        //   'assets/icons/message_icon.png',
        //   height: 24,
        // )
      ],
    );
  }

  Widget _searchContent(){
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: const [
          Padding(
              padding: EdgeInsets.only(left: 8, right: 3),
              child:Icon(
                Icons.search,
                size: 20,
                color: Colors.black45,
              ),
          ),
          Text(
            '搜索关键词',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}



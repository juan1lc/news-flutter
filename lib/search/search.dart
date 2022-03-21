import 'package:flutter/material.dart';

class SearchHead extends StatelessWidget {
  const SearchHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo01.png',
          height: 40,
        ),
        Expanded(
            child: _searchContent(),
        ),
        Image.asset(
          'assets/icons/message_icon.png',
          height: 24,
        )
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



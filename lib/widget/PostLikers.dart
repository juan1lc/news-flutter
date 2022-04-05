import 'package:flutter/material.dart';

import '../models/posts/postLikers.dart';
import '../util/color.dart';

class PostLikersView extends StatefulWidget {
  const PostLikersView({Key? key, required this.postLikers}) : super(key: key);

  final List<PostLikers> postLikers;
  @override
  _PostLikersViewState createState() => _PostLikersViewState();
}

class _PostLikersViewState extends State<PostLikersView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-380,
      color: primary,
        child: ListView.builder(
          itemCount: widget.postLikers.length,

          itemBuilder: (BuildContext context, int index){
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left:20, right: 20, top: 8, bottom: 8),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.postLikers[index].photo),
                    radius: 25,
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.postLikers[index].username, style: TextStyle(
                          color: Colors.black87,fontSize: 18
                      ),),
                      SizedBox(height: 2,),
                      Text(widget.postLikers[index].liketime, style: TextStyle(
                          color: Colors.black45,fontSize: 15
                      ),),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.thumb_up_outlined, color: loginColor,),
                ],
              ),
            );
          },
        )
    );
  }
}

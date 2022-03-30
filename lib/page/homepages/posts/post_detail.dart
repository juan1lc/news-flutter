import 'package:flutter/material.dart';

import '../../../models/postCard.dart';
import '../../../util/color.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({Key? key, required this.postCard,
    required this.username, required this.avatar}) : super(key: key);

  final String username, avatar;
  final PostCard postCard;
  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('动态详情'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: loginColor,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey,),
        ),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_horiz)),
        ],
        backgroundColor: page,
        foregroundColor: Colors.black45,
      ),
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
                child: Column(
                  children: <Widget> [
                    Column(
                      children: <Widget> [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(left:20, right: 20,
                              top: 15, bottom: 15),
                          decoration: const BoxDecoration(
                            color: primary,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _Publisher(username: widget.username,
                                  avatar: widget.avatar),
                              const SizedBox(height: 20,),
                              Text(widget.postCard.content,
                                style: const TextStyle(
                                    color: Colors.black87 ,fontSize: 18, letterSpacing: 1.5
                                ),),
                              const SizedBox(height: 20,),
                              (widget.postCard.tags!=null)?
                              Text('# '+widget.postCard.tags.toString(),
                                style: const TextStyle(
                                    color: loginColor,fontSize: 16, letterSpacing: 1
                                ),)
                              :const SizedBox(height: 0),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(left:20, right: 20, top: 10, bottom: 15),
                          decoration: const BoxDecoration(
                            color: primary,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: (){print('转发');},
                                  child: Text('转发 0', style: TextStyle(
                                    color: Colors.black87, fontSize: 15
                                  ),)),
                              const SizedBox(width: 15,),
                              InkWell(
                                  onTap: (){print('评论');},
                                  child: Text('评论 '+widget.postCard.commentCount.toString()
                                      , style: const TextStyle(
                                      color: Colors.black87, fontSize: 15
                                  ))),
                              const Spacer(),
                              InkWell(
                                  onTap: (){print('赞');},
                                  child: Text('赞 '+widget.postCard.postLike.toString()
                                      , style: const TextStyle(
                                          color: Colors.black87, fontSize: 15
                                      ))),
                            ],
                          )
                        ),
                        const SizedBox(height: 6,),
                      ],
                    )
                  ],
                ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: page,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5)
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45.withOpacity(0.4),
                        offset: Offset(0, -2.0), //阴影y轴偏移量
                        blurRadius: 20, //阴影模糊程度
                        spreadRadius: 3 //阴影扩散程度
                    )
                  ]
              ),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: (){print('转发按钮');},
                    child: Row(
                      children: const [
                        Icon(Icons.repeat),
                        SizedBox(width: 4,),
                        Text('转发'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){print('评论按钮');},
                    child: Row(
                      children: const [
                        Icon(Icons.comment_outlined),
                        SizedBox(width: 4,),
                        Text('评论'),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){print('赞按钮');},
                    child: Row(
                      children: const [
                        Icon(Icons.thumb_up_alt_outlined),
                        SizedBox(width: 4,),
                        Text('赞'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

class _Publisher extends StatelessWidget {
  const _Publisher({Key? key, required this.username,
  required this.avatar})
      : super(key: key);

  final String username, avatar;

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
            Text("22-3-30 15:00")
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


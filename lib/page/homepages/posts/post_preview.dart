import 'package:flutter/material.dart';
import 'package:news_app/models/postCard.dart';
import 'package:news_app/page/homepages/posts/post_detail.dart';
import 'package:news_app/util/color.dart';

class PostPreView extends StatelessWidget {
  const PostPreView({Key? key, required this.avatar,
    required this.username, required this.postCard, this.userid})
      : super(key: key);

  final String avatar, username;
  final String? userid;
  final PostCard postCard;

  @override
  Widget build(BuildContext context) {
    print(postCard);
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>
                PostDetail(postCard: postCard, username: username, avatar: avatar,
                userid: userid,)
        ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left:20, right: 20, top: 15, bottom: 15),
        decoration: const BoxDecoration(
          color: primary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Row(
              children: <Widget> [
                CircleAvatar(backgroundImage: AssetImage(avatar), radius: 25,),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username, style: const TextStyle(color: Colors.black87, fontSize: 18),),
                    const SizedBox(height: 5,),
                    (postCard.updateTime!=null)? Text(postCard.updateTime!,
                      style: const TextStyle(color: Colors.black45, fontSize: 14),)
                        :const SizedBox(height: 0,),
                  ],
                ),
                const Spacer(),
                IconButton(onPressed: (){}, icon: const Icon(
                  Icons.keyboard_arrow_down_outlined, color: Colors.grey,))
              ],
            ),
            const SizedBox(height: 20,),
            Text(
              postCard.content,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
            (postCard.tags !=null)? Column(
              children: [
                SizedBox(height: 10,),
                Text('# '+postCard.tags.toString(),
                  style: const TextStyle(color: loginColor, fontSize: 16),)
              ],
            ):const SizedBox(height: 0,),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(
                      Icons.repeat, color: Colors.grey,)),
                    const SizedBox(width: 1,),
                    const Text('转发', style: TextStyle(color: Colors.grey,),)
                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(
                      Icons.comment_outlined, color: Colors.grey,)),
                    const SizedBox(width: 1,),
                    (postCard.commentCount==0)?const Text('评论',
                      style: TextStyle(color: Colors.grey,),)
                        : Text(postCard.commentCount.toString(),
                      style: TextStyle(color: Colors.grey,),),
                  ],
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){

                      }, icon: const Icon(
                      Icons.thumb_up_outlined, color: Colors.grey,)),
                    const SizedBox(width: 1,),
                    (postCard.postLike==0)?const Text('点赞',
                      style: TextStyle(color: Colors.grey,),)
                        :Text(postCard.postLike.toString(),
                      style: TextStyle(color: Colors.grey,),),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

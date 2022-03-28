import 'package:flutter/material.dart';

import '../../../util/color.dart';

class EditingHead extends StatelessWidget {
  EditingHead({Key? key, required this.avatar, required this.id})
      : super(key: key);
  String avatar, id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _editAvatar(context, id);
      },
      child: Stack(
        children: <Widget> [
          Container(
            padding: const EdgeInsets.only(top:5),
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: const BoxDecoration(
              color: loginColor,
            ),
            child: Container(
              padding: const EdgeInsets.only(bottom: 10, right: 20, left: 20),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  CircleAvatar(backgroundImage: AssetImage(avatar), radius: 40,),
                  SizedBox(height: 5,),
                  Text("点击头像可更换照片", style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              child: Image(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  fit: BoxFit.fitWidth,
                  image: const AssetImage('assets/images/bg.png'))
          ),
        ],
      ),
    );
  }
}

Future<dynamic> _editAvatar(BuildContext context, String id){
  return showModalBottomSheet(context: context,
      //自定义底部弹窗布局
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)),
      ),
      backgroundColor: primary,
      builder: (BuildContext context){
        return Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          height: 220,
          child: Column(
            children: <Widget>[
              const Icon(Icons.horizontal_rule, color: Colors.black45, size: 26,),
              const Text("上传头像",style: TextStyle(color: Colors.black45, fontSize: 16)),
              const SizedBox(height: 5,),
              FractionallySizedBox(
                widthFactor: 1,
                child: TextButton(
                    onPressed: (){} ,
                    child: const Text("拍照",style: TextStyle(
                        color: Colors.black87, fontSize: 16)
                    )
                ),
              ),
              const SizedBox(height: 5,),
              FractionallySizedBox(
                widthFactor: 1,
                child: TextButton(
                    onPressed: ()async{
                      //final List<AssetEntity>? result = await AssetPicker.pickAssets(context);
                    } ,
                    child: const Text("从相册选择",style: TextStyle(
                        color: Colors.black87, fontSize: 16),
                    )
                ),
              ),
              SizedBox(height: 5,),
              FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(page),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(color: Colors.black)
                      ),
                    ),
                    onPressed: () { Navigator.pop(context); },
                    child: const Text("取 消", style: TextStyle(color: Colors.black87),),
                  )
              ),
            ],
          ),
        );
      });
}

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';

class DiscussBanner extends StatefulWidget {
  const DiscussBanner({Key? key}) : super(key: key);

  @override
  _DiscussBanner createState() => _DiscussBanner();
}

var imageHeight = 150;
var imageWidth = 350;

class _DiscussBanner extends State<DiscussBanner> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width / imageWidth * imageHeight;
    return SizedBox(
        height: height,
        child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return Image.network("https://via.placeholder.com/350x150",fit: BoxFit.fill,);
          },
          itemCount: 3,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
        )
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard(
      {Key? key,
        required this.title,
        required this.description,
        required this.image,
        required this.onPress})
      : super(key: key);
  final String title, description, image;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 190,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      margin: const EdgeInsets.only(right: 50),
      child: GestureDetector(
        onTap: onPress,
        child: Stack(
          children: <Widget>[
            Image.asset(image),
            Positioned(
              left: 15,
              top: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black, fontSize: 18, height: 1.5),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 14,
                        height: 1.5),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
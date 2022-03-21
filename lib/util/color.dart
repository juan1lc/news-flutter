import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color primary = Color(0xffffffff);
const Color success = Color(0xff07c160);
const Color danger = Color(0xffee0a24);
const Color warning = Color(0xffffba00);
const Color info = Color(0xff00a1d6);
const Color active = Color(0xff464646);
const Color ac2tive = Color(0xffee0a1d);
const Color unactive = Color(0xff7b7b7b);
const Color un2active = Color(0xffb1b1b1);
const Color un3active = Color(0xffb1b1b1);
const Color page = Color(0xffefefef);
const Color nav = Color(0xfffbfbfb);
const Color border = Color(0xfff5f5f5);
const Color loginColor = Color(0xff1013b2);

Color string2Color(String colorString){
  int? value = 0x00000000;
  if(colorString.isNotEmpty){
    if(colorString[0] == '#'){
      colorString = colorString.substring(1);
    }
    value = int.tryParse(colorString, radix: 16);
    if( value != null){
      if(value < 0xFF000000){
        value += 0xFF000000;
      }
    }
  }
  return Color(value!);
}
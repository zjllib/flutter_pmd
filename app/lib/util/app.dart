import 'dart:ui';

import 'package:flutter/material.dart';


class App {
  //屏幕大小
  static double screenWidth;
  static double screenHigh;

  //显示文字
  static String text="这是演示文字";

  //文字颜色
  static Color textColor=Colors.black;

  //文字方向
  static double textDirection=0;

  //文字大小
  static double textSize=28.0;

  static List<String> textTypes=["系统默认","像素体","肥圆体","哇咔咔"];

  //文字字体类型
  static String textType="系统默认";

  //背景颜色
  static Color bgColor=Colors.teal;

  //滚动速度
  static double textSpeed=50.0;
}
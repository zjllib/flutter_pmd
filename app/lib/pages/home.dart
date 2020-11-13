import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/model/app.dart';
import 'file:///F:/APP/flutter_pmd/app/lib/widgets/myslider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // TODO: implement build
    return Container(
      width: App.screenWidth,
      height: App.screenHigh,
      color: App.bgColor,
      alignment: Alignment.center,
      child:MoveComponent(
        stepOffset: App.textSpeed,
        isHorizontal: false,),
    );
  }
}

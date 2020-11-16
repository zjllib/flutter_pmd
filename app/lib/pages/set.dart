import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/model/app.dart';
import 'package:app/widgets/color_picker.dart';
import 'package:app/widgets/myslider.dart';
import 'package:flustars/flustars.dart';
import 'home.dart';
import 'package:app/routes.dart';

//**设置页**//
class SetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SetPageState();
  }
}

class _SetPageState extends State<SetPage> with TickerProviderStateMixin {
  TextEditingController _controller;
 //double _screenM=ScreenUtil.getInstance().screenWidth/
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController.fromValue(TextEditingValue(
      text: App.text,
    ));
   App.screenWidth=ScreenUtil.getInstance().screenWidth;
   App.screenHigh=ScreenUtil.getInstance().screenHeight;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          "设置",
//        ),
//        centerTitle: true,
//        backgroundColor: App.bgColor,
//      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            color: App.bgColor,
            alignment: Alignment.center,
            child:MoveComponent(stepOffset: App.textSpeed,),
          ),
          OptionItem(
              title: "显示文字",
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30), //边角为30
                    ),
                    borderSide: BorderSide(
                      color: Colors.black12,
                      width: 0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30), //边角为30
                    ),
                    borderSide: BorderSide(
                      color: Colors.black12,
                      width: 0,
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                  filled: true,
                  fillColor: Colors.black12,
                  suffixIcon: IconButton(icon: Icon(Icons.forward_30), onPressed:(){
                    App.textDirection+=pi/6;
                    setState(() {});
                  }),
                ),
                textInputAction: TextInputAction.done,
//              maxLength: 15,
                controller: _controller,
                style: TextStyle(fontSize: 18, color: Colors.black54),
                onChanged: (text) {
                  App.text = text;
//                  print(text);
                },
                onSubmitted: (text) {
                  setState(() {});
                },
              )),
          OptionItem(
              title: "字体类型",
              child: CupertinoButton(
                padding: EdgeInsets.all(6),
                child: Text(
                  "<<${App.textType}>>",
                  style: TextStyle(color: Colors.black, fontSize: 24,fontFamily:App.textType ),
                ),
                color: Colors.blueGrey[50],
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (context) {
                      List<Widget> textTypeSeclector=new List();
                      for(var i=0;i<App.textTypes.length;i++){
                        textTypeSeclector.add(
                          OutlineButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            App.textType=App.textTypes[i];
                            setState(() {});
                          },
                          borderSide: new BorderSide(color: Colors.black26),
                          child: Text(App.textTypes[i],style: TextStyle(color: Colors.black, fontSize: 24,fontFamily:App.textTypes[i] )),
                        ),);
                      }

                      return SimpleDialog(
                        titlePadding: EdgeInsets.only(left: 100, top: 10, bottom: 6),
                        contentPadding: EdgeInsets.only(left: 25, right: 25),
                        title: Text("字体选择"),
                        children: textTypeSeclector,
                      );
                    },
                  );
                },
              )
          ),
          OptionItem(
              title: "文字大小",
              child: MySlider(
                  value: App.textSize,
                  max: App.screenWidth-60,
                  min: 9,
                  onChanged: (v) {
                    App.textSize = v;
                    setState(() {});
                  })),
          OptionItem(
              title: "滚动速度",
              child: MySlider(
                  value: App.textSpeed,
                  max: 105,
                  min: 0,
                  onChanged: (v) {
                    print("V=$v");
                    App.textSpeed = v;
                    setState(() {});
                  })
          ),
          OptionItem(
              title: "字体颜色",
              child: ColorPickers(
                target:Container(
                  height: 20,
                  color: App.textColor,),
                onConfirm: (Color color) {
//                  print("font color=${color.value}");
                  App.textColor=color;
                  setState(() {});
                },
              ),
          ),
          OptionItem(
            title: "背景颜色",
            child: ColorPickers(
              target:Container(
                height: 20,
                color: App.bgColor,),
              onConfirm: (Color color) {
                print("font color=${color.value}");
                App.bgColor=color;
                setState(() {});
              },
            ),
          ),
          RaisedButton(
            child: Text("SHOW",style: TextStyle(letterSpacing: 1,wordSpacing:10,fontSize: 45,color: Colors.white ),),
            color: Colors.blueGrey,
            hoverColor: Colors.black,
            splashColor: Colors.black,
            highlightColor: Colors.black,
            onPressed: (){
               Navigator.pushNamed(context, pages.home);
              })
        ],
      ),
    );
  }
}

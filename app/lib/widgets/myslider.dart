import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../model/app.dart';

typedef ValueChanged<T> = void Function(T value);

class MySlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const MySlider({
    @required this.value,
    this.min = 0.0,
    this.max = 1.0,
    this.onChanged,
  }) : assert(value != null);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MySliderState();
  }
}

class _MySliderState extends State<MySlider> {
  double curValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    curValue = widget.value;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Slider(
//      key: widget.key,
      value: curValue,
      min: widget.min,
      max: widget.max,
      onChanged: (double v) {
//        print(v);
        setState(() {
          curValue = v;
          widget.onChanged(v);
        });
      },
    );
  }
}

//选项
class OptionItem extends StatelessWidget {
  final String title;
  final Widget child;
  OptionItem({this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor))),
      child: Row(
        children: <Widget>[
          Text(
            "$title",
            style: TextStyle(fontSize: 18,color: Colors.black54),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: 5,
              ),
              child:child,
            ),
          )
        ],
      ),
    );
  }
}


class MoveComponent extends StatefulWidget {
  final Duration duration= const Duration(seconds: 1);
  final bool isHorizontal;
  final double stepOffset;

  MoveComponent(
      {Key key,
        this.stepOffset=1.0,
        this.isHorizontal =true})
      : super(key: key);
  @override
  _MoveComponentState createState() => _MoveComponentState();
}
class _MoveComponentState extends State<MoveComponent> {
  ScrollController _controller;
  Timer _timer;
  double _offset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController(initialScrollOffset: _offset);
    _timer = Timer.periodic(widget.duration, (timer) {
      double newOffset = _controller.offset + widget.stepOffset;
//      print("_controller.offset=${_controller.offset}");
      if (newOffset != _offset) {
        _offset = newOffset;
        _controller.animateTo(_offset, duration: widget.duration, curve: Curves.linear);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: widget.isHorizontal?Axis.horizontal:Axis.vertical,
        controller: _controller,
        itemBuilder: (context, index) {
          //扩展
          var extend =widget.isHorizontal? Container(
            width: App.screenWidth,
          ):Container(
            height: App.screenHigh,
          );
          var direction=widget.isHorizontal?App.textDirection:App.textDirection+pi/2;
          List<Widget> widgets=new List();
          for(var i=0;i<App.text.length;i++){
            widgets.add(Transform.rotate(angle:direction,child:Text(App.text[i],style: TextStyle(height:1.0,decoration:TextDecoration.none,fontSize: App.textSize,color: App.textColor,fontFamily: App.textType),)));
          }
          widgets.add(extend);

          //填充
          Widget move=widget.isHorizontal?Row(
            children: widgets,
          ):Column(
            children:widgets,
          );
          return move;
        });
  }
}

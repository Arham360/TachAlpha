import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}

class MyAppState extends State<NotificationPage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<NotificationPage> {
  double _height = 50.0;
  double _width = 20.0;
  var _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(duration: Duration(seconds: 1),
                child: Center(child: Text("stuff",textAlign: TextAlign.center,style: TextStyle(),)),
                width: _width,
                height: _height,
                color: _color,),
//              new AnimatedSize(
//
//                curve: Curves.fastOutSlowIn, child: new Container(
//                width: _width,
//                height: _height,
//                color: _color,
//              ), vsync: this, duration: new Duration(seconds: 2),
// ),
              new Divider(height: 35.0,),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new IconButton(
                      icon: new Icon(Icons.arrow_upward, color: Colors.blue,),
                      onPressed: () =>
                          setState(() {
                            _color = Colors.blue;
                            _height = _height + 30;
                          })),
                  new IconButton(
                      icon: new Icon(Icons.arrow_forward, color: Colors.red,),
                      onPressed: () =>
                          setState(() {
                            _color = Colors.red;
                            _width = _width + 30;
                          })),
                ],
              )
            ],)
          ,)
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
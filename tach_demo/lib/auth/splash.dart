
import 'package:flutter/material.dart';
import 'package:tach_demo/auth/login.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashPage> {
  @override
  Widget build(BuildContext ctx) {
    return new Scaffold(
        body: Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/_backgrounds/welcome_background.imageset/welcome_background@1x.jpeg'), fit: BoxFit.cover)),
            child: new Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SplashWidgets.topSection(),
              SplashWidgets.bottomSection(ctx),
            ])));
  }
}

class SplashWidgets {
  static Widget topSection() {
    return Expanded(
        child: new Container(
            padding: EdgeInsets.all(24),
            child: new Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(padding: EdgeInsets.all(32), child: null),
              new Text('Tach', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30)),
              new Text('Simplistic & Secure Networking ™', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16))
            ])));
  }

  static Widget bottomSection(BuildContext ctx) {
    return new Container(
      padding: EdgeInsets.all(32),
      child: new OutlineButton(
        child: new Text('Continue', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16)),
        onPressed: () => Navigator.push(ctx, MaterialPageRoute(builder: (__) => LoginPage())),
      ),
    );
  }
}

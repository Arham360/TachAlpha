
import 'package:flutter/material.dart';
import 'package:tach_demo/bottomNavigation/bottomNav.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final TextEditingController controller = TextEditingController();

  Widget build(BuildContext ctx) {
    return new Scaffold(
        body: Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/_backgrounds/welcome_background.imageset/welcome_background@1x.jpeg'), fit: BoxFit.cover)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        LoginWidgets.topSection(),
        LoginWidgets.middleSection(controller),
        LoginWidgets.bottomSection(ctx, controller),
      ]),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class LoginWidgets {
  static Widget topSection() {
    return Expanded(
        child: new Container(
            padding: EdgeInsets.all(24),
            child: new Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              new Container(padding: EdgeInsets.all(32), child: null),
              new Text('Verification', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30))
            ])));
  }

  static Widget middleSection(TextEditingController controller) {
    return Expanded(
        child: new Container(
            padding: EdgeInsets.all(24),
            child: new Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              new TextField(
                autofocus: true,
                controller: controller,
                decoration: InputDecoration(filled: true, fillColor: Colors.grey[300], hintText: 'Phone Number'),
              )
            ])));
  }

  static Widget bottomSection(BuildContext ctx, TextEditingController controller) {
    return new Container(
      padding: EdgeInsets.all(32),
      child: new Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        OutlineButton(
            child: new Text('Verify', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16)),
            onPressed: () {
              var input = controller.text;
              if (input.isNotEmpty) Navigator.push(ctx, MaterialPageRoute(builder: (__) => MyHomePage()));
            }),
        OutlineButton(
          child: new Text('Cancel', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16)),
          onPressed: () => Navigator.pop(ctx),
        ),
      ]),
    );
  }
}

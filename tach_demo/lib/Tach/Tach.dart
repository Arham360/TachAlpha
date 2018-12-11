import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Tach extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TachState();
  }
}

class TachState extends State<Tach> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: RepaintBoundary(
                //key: globalKey,
                child: QrImage(
                  data: "Arham",
                  size: 300,
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () => printStuff(),
            color: Colors.white,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            child: Text("Scan",
                style: TextStyle(color: Colors.blue, fontSize: 20.0)),
          ),
          Container(
            height: 45.0,
          )
        ],
      ),
    );
  }



  printStuff() {
    print("wokring");
  }

}


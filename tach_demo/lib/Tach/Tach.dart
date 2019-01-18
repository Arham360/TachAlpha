import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tach_demo/Tach/scan.dart';
import 'package:tach_demo/profile/qrCard.dart';

class Tach extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TachState();
  }
}

class TachState extends State<Tach> with TickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _frontScale;
  Animation<double> _backScale;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _frontScale = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
    ));
    _backScale = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.5, 1.0, curve: Curves.easeOut),
    );
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
          Text(
            DateTime.now().toString()
          ),
          RaisedButton(
            onPressed: () => navigateToScanning(),
            color: Colors.white,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            child: Text("Scan",
                style: TextStyle(color: Colors.blue, fontSize: 20.0)),
          ),
          Container(
            height: 45.0,
          ),
          _buildCarousel(context, 1)
        ],
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        //Text('Carousel $carouselIndex'),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 200.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              //return _buildCarouselItem(context, carouselIndex, itemIndex);
              return _buildFlippingQRCard();
            },
          ),
        )
      ],
    );
  }

  Widget _buildFlippingQRCard() {
    return SafeArea(
      child: new Center(
        child: GestureDetector(
          onTap: _flip,
          child: new Stack(
            children: <Widget>[
              new AnimatedBuilder(
                child: new MyCustomCard(colors: Colors.orange),
                animation: _backScale,
                builder: (BuildContext context, Widget child) {
                  final Matrix4 transform = new Matrix4.identity()
                    ..scale(1.0, _backScale.value, 1.0);
                  return new Transform(
                    transform: transform,
                    alignment: FractionalOffset.center,
                    child: child,
                  );
                },
              ),
              new AnimatedBuilder(
                //child: new MyCustomCard(colors: Colors.blue),
                child: Container(
                  height: 144.0,
                  width: 360.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.blue),
                  child: Center(
                    child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/220px-QR_code_for_mobile_English_Wikipedia.svg.png"),
                  ),
                ),
                animation: _frontScale,
                builder: (BuildContext context, Widget child) {
                  final Matrix4 transform = new Matrix4.identity()
                    ..scale(1.0, _frontScale.value, 1.0);
                  return new Transform(
                    transform: transform,
                    alignment: FractionalOffset.center,
                    child: child,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _flip() {
    setState(() {
      if (_controller.isCompleted || _controller.velocity > 0)
        _controller.reverse();
      else
        _controller.forward();
    });
  }

  navigateToScanning() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScanScreen()),
    );

  }

}


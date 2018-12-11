import 'package:flutter/material.dart';
import 'package:tach_demo/contacts/Contact.dart';
import 'package:tach_demo/profile/animated_fab.dart';
import 'package:tach_demo/profile/diagonal_clipper.dart';
import 'package:tach_demo/profile/initial_list.dart';
import 'package:tach_demo/profile/list_model.dart';
import 'package:tach_demo/profile/qrCard.dart';
import 'package:tach_demo/profile/task_row.dart';

class ContactProfilePage extends StatefulWidget {
  ContactProfilePage({Key key, this.id}) : super(key: key);

  int id;

  @override
  State<StatefulWidget> createState() {
    return _ContactProfilePageState();
  }
}

class _ContactProfilePageState extends State<ContactProfilePage>
    with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey =
      new GlobalKey<AnimatedListState>();
  final double _imageHeight = 256.0;
  ListModel listModel;
  bool showOnlyCompleted = false;

  AnimationController _controller;
  Animation<double> _frontScale;
  Animation<double> _backScale;

  @override
  void initState() {
    super.initState();
    listModel = new ListModel(_listKey, tasks);

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
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          _buildTimeline(),
          _buildIamge(),
          _buildTopHeader(),
          _buildProfileRow(),
          _buildBottomPart(),
          //_buildFab(),
        ],
      ),
    );
  }

  Widget _buildFab() {
    return new Positioned(
        top: _imageHeight - 100.0,
        right: -40.0,
        child: new AnimatedFab(
          onClick: _changeFilterState,
        ));
  }

  void _changeFilterState() {
    showOnlyCompleted = !showOnlyCompleted;
    tasks.where((task) => !task.completed).forEach((task) {
      if (showOnlyCompleted) {
        listModel.removeAt(listModel.indexOf(task));
      } else {
        listModel.insert(tasks.indexOf(task), task);
      }
    });
  }

  Widget _buildIamge() {
    return new Positioned.fill(
      bottom: null,
      child: new ClipPath(
        clipper: new DialogonalClipper(),
        child: FadeInImage.assetNetwork(fadeInDuration: Duration(seconds: 1),height: _imageHeight,fit: BoxFit.cover,placeholder: "images/ironman.jpg", image: contacts[widget.id].picture),
//        child: new Image. asset(
//          'images/tony.jpg',
//          fit: BoxFit.cover,
//          height: _imageHeight,
//          colorBlendMode: BlendMode.srcOver,
//          color: new Color.fromARGB(120, 20, 10, 40),
//        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => _backButtonPressed(),
          ),
          new Expanded(
            child: new Padding(
              padding: const EdgeInsets.only(left: 16.0),
//              child: new Text(
//                "Timeline",
//                style: new TextStyle(
//                    fontSize: 20.0,
//                    color: Colors.white,
//                    fontWeight: FontWeight.w300),
//              ),
            ),
          ),
          IconButton(
              icon: Icon(
            Icons.menu,
            color: Colors.white,
          ))
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
    return new Padding(
        padding: new EdgeInsets.only(left: 16.0, top: _imageHeight / 2.5),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//            Hero(
//              /// Hero
//              tag: 'logo',
              //child:
              new CircleAvatar(
              minRadius: 28.0,
              maxRadius: 68.0,
              backgroundImage: new AssetImage('images/vic.jpg'),
            ),
              /// This is the flying widget
//            ),
//            new CircleAvatar(
//              minRadius: 28.0,
//              maxRadius: 68.0,
//              backgroundImage: new AssetImage('images/tony.jpg'),
//            ),
          ],
        )
//      child: new Row(
//        children: <Widget>[
//          new CircleAvatar(
//            minRadius: 28.0,
//            maxRadius: 48.0,
//            backgroundImage: new AssetImage('images/avatar.jpg'),
//          ),
//          new Padding(
//            padding: const EdgeInsets.only(left: 16.0),
//            child: new Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                new Text(
//                  'Ryan Barnes',
//                  style: new TextStyle(
//                      fontSize: 26.0,
//                      color: Colors.white,
//                      fontWeight: FontWeight.w400),
//                ),
//                new Text(
//                  'Huge ass title nameusidfhkjfskjfdhs',
//                  style: new TextStyle(
//                      fontSize: 14.0,
//                      color: Colors.white,
//                      fontWeight: FontWeight.w300),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
        );
  }

  Widget _buildBottomPart() {
    return new Padding(
      padding: new EdgeInsets.only(top: _imageHeight),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMyTasksHeader(),
          _buildTasksList(),
          //_buildFlippingQRCard(),
        ],
      ),
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

  Widget _buildTasksList() {
    return new Expanded(
      child: new AnimatedList(
        initialItemCount: tasks.length,
        key: _listKey,
        itemBuilder: (context, index, animation) {
          return new TaskRow(
            task: listModel[index],
            animation: animation,
          );
        },
      ),
    );
  }

  Widget _buildMyTasksHeader() {
    return new Padding(
      padding: new EdgeInsets.only(left: 64.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            contacts[widget.id].name,
            style: new TextStyle(fontSize: 34.0),
          ),
          new Text(
            'A genius, billionaire, playboy philanthropist',
            style: new TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
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

  Widget _buildTimeline() {
    return new Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 32.0,
      child: new Container(
        width: 1.0,
        color: Colors.grey[300],
      ),
    );
  }

  _backButtonPressed() {
    Navigator.pop(context,true);
  }
}

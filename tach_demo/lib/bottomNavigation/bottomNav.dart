import 'package:flutter/material.dart';
import 'package:tach_demo/Messenger/MessageList.dart';
import 'package:tach_demo/Settings/settings.dart';
import 'package:tach_demo/Tach/Tach.dart';
import 'package:tach_demo/bottomNavigation/fab_bottom_app_bar.dart';
import 'package:tach_demo/bottomNavigation/layout.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tach_demo/contacts/ContactScreen.dart';
import 'package:tach_demo/notification/notificationPage.dart';
import 'package:tach_demo/profile/profile.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int selected = 0;
  String title;

  final titles = ["Contacts", "Messages", "Tach", "Notifications", "Settings"];

  final List<Widget> _children = [
    ContactList("hi"),
    MessageList(),
    Tach(),
    NotificationPage(),
    SettingsPage(),
  ];

  void _selectedTab(int index) {
    setState(() {
      selected = index;
      title = titles[index];
    });
  }


  @override
  void initState() {
    super.initState();
    title = titles[selected];

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey,
        title: Text(title),
        leading: IconButton(icon: Icon(Icons.create), onPressed: null),
        actions: <Widget>[
          GestureDetector(
              onTap: () => _navigateToProfile(context, "Tony Stark"),
              child: Container(
                width: 60.0,
                height: 100.0,
                child: Hero(
                  /// Hero
                  tag: 'logo',
                child: ClipOval(
                  child: Image.asset("images/tony.jpg",fit: BoxFit.cover,),
                ),
                ),
              )
          )
        ],
      ),
        body: _children[selected],

      bottomNavigationBar: FABBottomAppBar(
        backgroundColor: Colors.black54,
        centerItemText: '',
        color: Colors.grey,
        selectedColor: Colors.blue,
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.contacts, text: ''),
          FABBottomAppBarItem(iconData: Icons.message, text: ''),
          FABBottomAppBarItem(iconData: Icons.person, text: ''),
          FABBottomAppBarItem(iconData: Icons.notifications, text: ''),
          FABBottomAppBarItem(iconData: Icons.settings, text: ''),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

//  Widget _buildFab(BuildContext context) {
//
//    return AnchoredOverlay(
//      showOverlay: true,
//      overlayBuilder: (context, offset) {
//        return CenterAbout(
//            position: Offset(offset.dx, offset.dy - icons.length),
//            child: Center());
//      },
//      child: FloatingActionButton(
//        backgroundColor: Colors.blue,
//        onPressed: () {
//          showModalBottomSheet(
//              context: context,
//              builder: (BuildContext context) {
//                final bodyHeight = MediaQuery.of(context).size.height -
//                    MediaQuery.of(context).viewInsets.bottom;
//                return Container(
//                  color: const Color(0xFFFFFFFF),
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        child: Center(
//                          child: RepaintBoundary(
//                            //key: globalKey,
//                            child: QrImage(
//                              data: "Arham",
//                              size: 0.3 * bodyHeight,
//                            ),
//                          ),
//                        ),
//                      ),
//                      RaisedButton(
//                        onPressed: () => printStuff(),
//                        color: Colors.white,
//                        shape: new RoundedRectangleBorder(
//                            borderRadius: new BorderRadius.circular(30.0)),
//                        child: Text("Scan",
//                            style:
//                                TextStyle(color: Colors.blue, fontSize: 20.0)),
//                      ),
//                      Container(
//                        height: 45.0,
//                      )
//                    ],
//                  ),
//                );
//              });
//        },
//        tooltip: 'Tach',
//        child: Icon(
//          icons[fab],
//        ),
//        elevation: 20.0,
//      ),
//    );
//  }
//
//  printStuff() {
//    print("wokring");
//  }

  _navigateToProfile(BuildContext context, String s) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfilePage(name: s)));
  }
}

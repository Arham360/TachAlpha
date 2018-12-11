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
  MyHomePage({Key key, this.title}) : super(key: key);

  String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int selected = 0;
  int fab = 0;

  final icons = [Icons.sms, Icons.mail, Icons.phone];

  void _selectedTab(int index) {
    setState(() {
     // _lastSelected = 'TAB: $index';
      fab = index;
      selected = index;
      widget.title = getTitle(index);
    });
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return "Contacts";
        break;
      case 1:
        return "Messages";
        break;
      case 2:
        return "Tach";
        break;
      case 3:
        return "Notifications";
        break;
      case 4:
        return "Settings";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> _children = [
      ContactList("hi"),
      MessageList(),
      Tach(),
      NotificationPage(),
      SettingsPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey,
        title: Text(widget.title),
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
          //RaisedButton(onPressed: null,child: Image.network("https://cdn.newsapi.com.au/image/v1/bb9b894d3ea95cdd0bcbaf0a6393914d?width=316"),)
          //IconButton(icon: Icon(Icons.insert_emoticon), onPressed: null)
        ],
      ),
//      body: Center(
//        child: Text(
//          _lastSelected,
//          style: TextStyle(fontSize: 32.0),
//        ),
//      ),
        body: _children[selected],

      bottomNavigationBar: FABBottomAppBar(
        backgroundColor: Colors.black54,
        centerItemText: '',
        color: Colors.grey,
        selectedColor: Colors.blue,
        //notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.contacts, text: ''),
          FABBottomAppBarItem(iconData: Icons.message, text: ''),
          FABBottomAppBarItem(iconData: Icons.person, text: ''),
          FABBottomAppBarItem(iconData: Icons.notifications, text: ''),
          FABBottomAppBarItem(iconData: Icons.settings, text: ''),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: _buildFab(context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFab(BuildContext context) {

    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
            position: Offset(offset.dx, offset.dy - icons.length),
            child: Center());
      },
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                final bodyHeight = MediaQuery.of(context).size.height -
                    MediaQuery.of(context).viewInsets.bottom;
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
                              size: 0.3 * bodyHeight,
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
                            style:
                                TextStyle(color: Colors.blue, fontSize: 20.0)),
                      ),
                      Container(
                        height: 45.0,
                      )
                    ],
                  ),
                );
              });
        },
        tooltip: 'Tach',
        child: Icon(
          icons[fab],
        ),
        elevation: 20.0,
      ),
    );
  }

  printStuff() {
    print("wokring");
  }

  _navigateToProfile(BuildContext context, String s) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfilePage(name: s)));
  }
}

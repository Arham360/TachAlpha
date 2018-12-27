import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:tach_demo/contacts/Contact.dart';
import 'package:tach_demo/profile/contactProfile.dart';
import 'package:tach_demo/profile/profile.dart';
import 'package:flutter_offline/flutter_offline.dart';


class ContactList extends StatefulWidget {
  
  ContactList(this.name);
  String name;

  @override
  ContactListState createState() {
    return new ContactListState();
  }
}

class ContactListState extends State<ContactList> with AutomaticKeepAliveClientMixin<ContactList> {
  @override
  Widget build(BuildContext context) {

    return OfflineBuilder(
      connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
          ) {
        if (connectivity == ConnectivityResult.none) {
          return Container(
            color: Colors.black,
            child: Center(
              child: Text(
                "we offline dudez",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else {
          return child;
        }
      },
      builder: (BuildContext context) {
        return Column(
      children: <Widget>[
        new Expanded(
          child: new Container(
           // color: new Color(0xFF736AB7),
            child: new CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              slivers: <Widget>[
                new SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  sliver: new SliverList(
                    delegate: new SliverChildBuilderDelegate(
                          (context, index) =>
                          //ProfilePage(name: contacts[index].name),
                      new ContactSummary(contacts[index]),
                      childCount: contacts.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
      },
    );


//    return Column(
//      children: <Widget>[
//        new Expanded(
//          child: new Container(
//           // color: new Color(0xFF736AB7),
//            child: new CustomScrollView(
//              scrollDirection: Axis.vertical,
//              shrinkWrap: false,
//              slivers: <Widget>[
//                new SliverPadding(
//                  padding: const EdgeInsets.symmetric(vertical: 24.0),
//                  sliver: new SliverList(
//                    delegate: new SliverChildBuilderDelegate(
//                          (context, index) =>
//                          //ProfilePage(name: contacts[index].name),
//                      new ContactSummary(contacts[index]),
//                      childCount: contacts.length,
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//      ],
//    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ContactSummary extends StatelessWidget {

  final Contact contact;
  final bool horizontal;

  ContactSummary(this.contact, {this.horizontal = true});

  ContactSummary.vertical(this.contact): horizontal = false;


  @override
  Widget build(BuildContext context) {
    final contactThumbnail = new Container(
        margin: new EdgeInsets.symmetric(
            vertical: 16.0
        ),
        alignment: horizontal ? FractionalOffset.centerLeft : FractionalOffset
            .center,
        child:
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FadeInImage.assetNetwork(fadeInDuration: Duration(seconds: 1),
              height: 92.0,
              width: 92.0,
              fit: BoxFit.cover,
              placeholder: "images/vic.jpg",
              image: contact.image),
        ));


    final cardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: horizontal
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(contact.name),
          new Container(height: 10.0),
        ],
      ),
    );


    final contactCard = new Container(
      child: cardContent,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );


    return new GestureDetector(
        onTap: horizontal
            ? () =>
            Navigator.of(context).push(
              new PageRouteBuilder(
                pageBuilder: (_, __, ___) =>
                new ContactProfilePage(id: contact.id,),
                transitionsBuilder: (context, animation, secondaryAnimation,
                    child) =>
                new FadeTransition(opacity: animation, child: child),
              ),
            )
            : null,
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              contactCard,
              contactThumbnail,
            ],
          ),
        )
    );
  }
}
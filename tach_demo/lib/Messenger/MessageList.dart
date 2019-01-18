import 'package:flutter/material.dart';
import 'package:tach_demo/contacts/Contact.dart';
import 'package:tach_demo/profile/qrCard.dart';

class MessageList extends StatefulWidget{
  @override
  MessageListState createState() {
    return new MessageListState();
  }
}

class MessageListState extends State<MessageList> {

  var contactList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contactList = contacts;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      children: <Widget>[
//search bar
        Container(
          padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(25.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  contentPadding:
                  EdgeInsets.only(left: 15.0, top: 15.0),
                  hintText: 'Search for People???(im bad at ux shit)',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
        ),

        Container(
          height: 125.0,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          color: Colors.blue),
                      child: IconButton(
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        onPressed: () {},
                      )),
                  SizedBox(height: 7.0),
                  Text('Add To',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600))
                ],
              ),
              SizedBox(width: 25.0),
              listItem(contactList[0].image, contactList[0].name, true),
              SizedBox(width: 25.0),
              listItem(contactList[1].image, contactList[1].name, true),
              SizedBox(width: 25.0),
              listItem(contactList[2].image, contactList[2].name, false),
              SizedBox(width: 25.0),
              listItem(contactList[3].image, contactList[3].name, false),
            ],
          ),
        ),
        //other list goes down here. Should scroll just fine
      ],
    );
  }

  Widget listItem(String imgPath, String name, bool available) {
    return Column(
      children: <Widget>[
        Container(
          height: 70.0,
          width: 70.0,
          child: ClipOval(child: Image.network(imgPath)),
        ),
        SizedBox(height: 7.0),
        Row(
          children: <Widget>[
            Text(name,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600)),
            SizedBox(width: 4.0),
            available
                ? Container(
              height: 10.0,
              width: 10.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.blue),
            )
                : Container()
          ],
        )
      ],
    );
  }

}

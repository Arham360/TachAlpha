import 'package:flutter/material.dart';


class ContactList extends StatelessWidget{
  
  ContactList(this.name);
  String name;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(name),
    );
  }

}
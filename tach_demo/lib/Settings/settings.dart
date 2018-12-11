import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';



class SettingsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        _buildTile(
          Padding
            (
            padding: const EdgeInsets.all(24.0),
            child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                    (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text('Edit', style: TextStyle(color: Colors.blueAccent)),
                      Text('Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0))
                    ],
                  ),
                  Material
                    (
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center
                        (
                          child: Padding
                            (
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                          )
                      )
                  )
                ]
            ),
          ),
        ),
        _buildTile(
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column
              (
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  Material
                    (
                      color: Colors.teal,
                      shape: CircleBorder(),
                      child: Padding
                        (
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(Icons.settings_applications, color: Colors.white, size: 30.0),
                      )
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text('General', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                  Text('Name, Password', style: TextStyle(color: Colors.black45)),
                ]
            ),
          ),
        ),
        _buildTile(
          Padding
            (
            padding: const EdgeInsets.all(24.0),
            child: Column
              (
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>
                [
                  Material
                    (
                      color: Colors.amber,
                      shape: CircleBorder(),
                      child: Padding
                        (
                        padding: EdgeInsets.all(16.0),
                        child: Icon(Icons.notifications, color: Colors.white, size: 30.0),
                      )
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text('Alerts', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                  Text('Notifications ', style: TextStyle(color: Colors.black45)),
                ]
            ),
          ),
        ),
        _buildTile(
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding
              (
                padding: const EdgeInsets.all(24.0),
                child: Column
                  (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>
                  [
                    Row
                      (
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
                        Column
                          (
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>
                          [
                            Text('Other', style: TextStyle(color: Colors.green)),
                            Text('Things', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0)),
                          ],
                        ),

                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 4.0)),
                  ],
                )
            ),
          ),
        ),
        _buildTile(
          Padding
            (
            padding: const EdgeInsets.all(24.0),
            child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                    (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text('Other', style: TextStyle(color: Colors.redAccent)),
                      Text('Logout', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0))
                    ],
                  ),
                  Material
                    (
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center
                        (
                          child: Padding
                            (
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.store, color: Colors.white, size: 30.0),
                          )
                      )
                  )
                ]
            ),
          ),
          //onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ShopItemsPage())),
        )
      ],
      staggeredTiles: [
        StaggeredTile.extent(2, 110.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(2, 220.0),
        StaggeredTile.extent(2, 110.0),
      ],
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child: child
        )
    );
  }

}
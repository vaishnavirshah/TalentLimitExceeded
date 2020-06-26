import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainDrawer extends StatelessWidget {
  
 // final receiverName;
  //MainDrawer(this.receiverName);
  @override
  Widget buildListTile(String title, Function tapHandler, Icon symbol) {
    return ListTile(
      leading: symbol,
      title: Text(title),
      onTap: tapHandler,
    );
  }

  Widget build(BuildContext context) {
    return Drawer(
      
      child: Column(
        
        children: <Widget>[
          Container(
            color: Colors.black,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 50, left: 10),
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: [
                  Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Hello',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ]),
                SizedBox(
                  height: 0.5,
                ),
                GestureDetector(
                  child: Text(
                    'View Profile Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                )

                //FlatButton(onPressed: () {}, child: Text('View Profile')),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 5,
          ),
          //  buildListTile('Hello Username', () {}),
          // buildListTile('View Profile', () {}),
          buildListTile(
              'Past Orders',
              () {},
              Icon(
                Icons.history,
                color: Colors.black,
              )),
          SizedBox(
            height: 5,
          ),
          buildListTile(
              'Settings', () {}, Icon(Icons.settings, color: Colors.black)),
          SizedBox(
            height: 5,
          ),
          buildListTile(
              'About Us', () {}, Icon(Icons.info, color: Colors.black)),
          SizedBox(
            height: 5,
          ),
          buildListTile('Logout', () {
            Firestore.instance
                .collection('receiver/U2Sxj8nXSf04GgsZr5el/abc')
                .snapshots()
                .listen((data) {
              print(data);
            });
          },
              Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}

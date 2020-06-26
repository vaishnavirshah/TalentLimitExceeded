import 'package:flutter/material.dart';
import '../screens/about.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/pastorders.dart';

class MainDrawer extends StatelessWidget {
  int value=0;
 // final receiverName;
  //MainDrawer(this.receiverName);
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
              'Your Orders',
              () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(PastOrdersScreen.routeName);
              },
              Icon(
                Icons.history,
                color: Colors.black,
              )),
          /*    SizedBox(
            height: 5,
          ),
          buildListTile(
              'Settings', () {}, Icon(Icons.settings, color: Colors.black)),*/
          SizedBox(
            height: 5,
          ),
          buildListTile(
              'About Us', () {
                Navigator.of(context).pop();
                 Navigator.of(context).pushNamed(AboutUs.routeName);
              }, Icon(Icons.info, color: Colors.black)),
          SizedBox(
            height: 5,
          ),
          buildListTile('Logout', () {
            value=1;
            if(value==1)
            {
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
              FirebaseAuth.instance.signOut();
             
            }
       
              // Navigator.of(context).pushNamed(SplashScreen.routeName);
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

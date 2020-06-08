import 'package:flutter/material.dart';
import 'package:tle2/screens/add_order.dart';

import '../widgets/order_list.dart';
import '../models/orders.dart';

class DonorMain extends StatefulWidget {
  static const routeName = '/donor-main';
  @override
  _DonorMainState createState() => _DonorMainState();
}

class _DonorMainState extends State<DonorMain> {
  final List<Orders> _loadedOrders = [
    Orders(
      range: 2, 
      isVeg: true, 
      description: 'Roti',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'SAHARA', 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic
            ),
          ),
        ),
        drawer: Drawer(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 120,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Options',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 25
                  ),
                  title: Text(
                    'Profile',
                  style: TextStyle(
                    fontSize: 20,
                    ),
                  ),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(
                    Icons.info,
                    size: 25
                  ),
                  title: Text(
                    'About us',
                  style: TextStyle(
                    fontSize: 20,
                    ),
                  ),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    size: 25
                  ),
                  title: Text(
                    'Settings',
                  style: TextStyle(
                    fontSize: 20,
                    ),
                  ),
                  onTap: (){},
                ),
                SizedBox(height: 170,),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    size: 25,
                  ),
                  title: Text(
                    'Logout',
                  style: TextStyle(
                    fontSize: 20,
                    ),
                  ),
                  onTap: (){},
                ),
              ],
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(  
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    child: Text(
                      'Donations:  ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                OrdersList(_loadedOrders),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(AddOrder.routeName);
          },
        ),
      );
  }
}


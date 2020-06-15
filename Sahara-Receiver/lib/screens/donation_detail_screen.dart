
import 'package:flutter/material.dart';
import './confirm_order_screen.dart';

//import './confirm_order_screen.dart';
class DonationDetailScreen extends StatefulWidget {
  static const routeName = 'donation-detail-screen';

  @override
  _DonationDetailScreenState createState() => _DonationDetailScreenState();
}

class _DonationDetailScreenState extends State<DonationDetailScreen> {
  Map userData = {};

  Future orderConfirm(BuildContext context) {
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              content: Text('Are you sure?'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(ConfirmOrderScreen.routeName);
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(color: Colors.black),
                    )),
                FlatButton(
                  onPressed: () {},
                  child: Text('No', style: TextStyle(color: Colors.black)),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    userData = ModalRoute.of(context).settings.arguments;
    final rangeNumber = userData['range'].toString();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          child: Container(
              color: Colors.green,
              child: FlatButton(
                  onPressed: () {
                    orderConfirm(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text(
                        'CONFIRM',
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ],
                  ))),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                color: Colors.black,
                child: ListTile(
                 
                  title: Text(userData['donorName'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic)),
                  subtitle: Text(userData['typeofdonor'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              //Divider(color: Colors.black,),
              Container(
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(userData['email'],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic)),
                    SizedBox(
                      height: 2,
                    ),
                    Text(userData['contact'].toString(),
                        style: TextStyle(
                            textBaseline: TextBaseline.alphabetic,
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic))
                  ],
                ),
              ),
              Container(
                child: ListTile(
                  title: Text(
                    'Type:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text(
                    userData['isVeg'] ? 'Vegetarian' : 'Non-Vegetarian',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Divider(
                thickness: 4,
              ),
              Container(
                child: ListTile(
                  title: Text('Range:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  subtitle: Text('Serves nearly $rangeNumber ',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(
                thickness: 4,
              ),
              Container(
                child: ListTile(
                  title: Text('Food Description:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  subtitle: Text(userData['foodDescription'],
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(
                thickness: 4,
              ),
              Container(
                child: ListTile(
                  title: Text('Address:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  subtitle:
                      Text(userData['address'], style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
          ),
        ));
  }
}

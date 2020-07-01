import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:sahara/screens/timer.dart';
//import './confirm_order_screen.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';


//import './confirm_order_screen.dart';
class PastOrderDetailScreen extends StatefulWidget {
  static const routeName = 'pastorders-detail-screen';

  @override
  _PastOrderDetailScreenState createState() => _PastOrderDetailScreenState();
}

class _PastOrderDetailScreenState extends State<PastOrderDetailScreen> {
  Map userData = {};
  bool isLoading = false;
  var hasTimerStopped = false;


  @override
  Widget build(BuildContext context) {
    userData = ModalRoute.of(context).settings.arguments;
    final rangeNumber = userData['range'].toString();
    DateTime time1 = userData['date'].toDate();

    var date2 = time1.difference(DateTime.now()).inSeconds;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        bottomNavigationBar: BottomAppBar(
      
          child: Container(
              // color:userData['isConfirm']?Colors.grey:Colors.green,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    color: Colors.red,
                    child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.cancel,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              'CANCEL',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        )),
                  ),
                  
                      Container(
                        width: MediaQuery.of(context).size.width*0.5,
                        color: Colors.green,
                        child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              'RECEIVED',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        )),
                      ),
                ],
              )),
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
                          //fontStyle: FontStyle.italic
                        )),
                    SizedBox(
                      height: 2,
                    ),
                    Text(userData['contact'].toString(),
                        style: TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                          color: Colors.white,
                          fontSize: 20,
                          //fontStyle: FontStyle.italic
                        ))
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
              Divider(
                thickness: 4,
              ),
              Container(
                // width: 60.0,
                //padding: EdgeInsets.only(top: 3.0, right: 4.0),
                child: ListTile(
                  title: Text('Time until the order expires:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  subtitle: Align(
                    alignment: Alignment.bottomLeft,
                    child: CountDownTimer(
                      secondsRemaining: date2,
                      whenTimeExpires: () {
                        setState(() {
                          hasTimerStopped = true;
                        });
                      },
                      countDownStyle: TextStyle(
                          color: Colors.green, fontSize: 150.0, height: 100),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/donation_detail_screen.dart';
import '../my_flutter_app_icons.dart';

class PastOrdersScreen extends StatefulWidget {
  static const routeName = 'past-orders-screen';
  @override
  _PastOrdersScreenState createState() => _PastOrdersScreenState();
}

class _PastOrdersScreenState extends State<PastOrdersScreen> {
bool isConfirm=true;
  Widget getDonorTile(int i, final documents) {
    final rangenumber = documents[i]['range'];
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DonationDetailScreen.routeName, arguments: {
          
          'isConfirm':isConfirm,    
          'username': documents[i]['username'],
          'address': documents[i]['address'],
          'typeofdonor': documents[i]['typeofdonor'],
          'isVeg': documents[i]['isVeg'],
          'range': documents[i]['range'],
          'foodDescription': documents[i]['foodDescription'],
          'donorName': documents[i]['donorName'],
          'contact': documents[i]['contact'],
          'email': documents[i]['email'],
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.all(3),
          color: Colors.grey[50],
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: 60,
                      color: Colors.grey,
                    ),
                    Text(
                      documents[i]['username'],
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.confirmation_number,
                                color: Colors.black,
                                size: 20,
                              ),
                              SizedBox(width: 4,),
                              Text(
                                'Order Number:',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                          Text('1234',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic)),
                        ],
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.verified_user,
                      size: 15,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(documents[i]['typeofdonor'],
                        style: TextStyle(
                            color: Colors.black, fontStyle: FontStyle.italic)),
                  ],
                ),
                Row(children: [
                  Icon(
                    Icons.supervised_user_circle,
                    size: 15,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Serves $rangenumber',
                    style:
                        TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.64),
                  documents[i]['isVeg']
                      ? Icon(
                          MyFlutterApp.primitive_dot,
                          size: 30,
                          color: Colors.green[700],
                        )
                      : Icon(
                          MyFlutterApp.primitive_dot,
                          size: 30,
                          color: Colors.red,
                        )
                ]),
                Row(children: [
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.calendar_today,
                    size: 20,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Received on: 19/6/2020 At 21:00 hrs',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),

                        // Text('At 21:00 hrs',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
                      ],
                    ),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text('Past Orders')),
        ),
        body: FutureBuilder(
          future: FirebaseAuth.instance.currentUser(),
          builder: (ctx,future1){
            if(future1.connectionState==ConnectionState.waiting)
            {
              return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  );
            }
                  return StreamBuilder(
                     stream: Firestore.instance.collection('receiver').document(future1.data.uid).orderBy('time',descending: true).collection('past orders').snapshots(),
              builder: (ctx, streamSnapshot) {
                if (streamSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  );
                }

                final documents = streamSnapshot.data.documents;
                return ListView.builder(
                    itemBuilder: (ctx, i) {
                      if (documents[i]['status'] ==false)
                      {
                        return Container(height:0,width:0);
                      }
                                                  
                      return getDonorTile(i, documents);
                    },
                    itemCount: documents.length);
              },
              );
          }
        ));
  }
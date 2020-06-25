import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class MyOrders extends StatelessWidget {
   static const routeName = 'past-orders-screen1';
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
          backgroundColor: Colors.black,
          title:  Text('My Orders')
        ), 
        body: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(borderRadius:BorderRadius.circular(10) , ),
        padding: EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
            future: FirebaseAuth.instance.currentUser(),
            builder: (ctx, snapshot1) {
              if (snapshot1.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ),
                    );
              }
              
              return StreamBuilder(
                  stream: Firestore.instance
                      .collection('donors')
                      .document(snapshot1.data.uid)
                      .collection('orders').orderBy('time',descending: true)
                      .snapshots(),
                  builder: (ctx, snapshot) {
                     if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ),
                    );
                  }
                    if (snapshot.data==null) {
                    return Center(
                      child:Text(
                        "nothing there"
                      ),
                    );
                  }
                  final documents=snapshot.data.documents;
                 /*return Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: ListView.builder(
                        itemBuilder: (ctx, i) {
                          return getDonorTile(i, documents);
                        },
                        itemCount: documents.length),
                  );*/
                    return ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (ctx, i) {
                           DateTime date = documents[i]['time'].toDate();

      // DateTime date1=documents[i]['date'].toTime();
     // var formattedDate = DateFormat.MMMd().format(date);
      //var formattedDate1 = DateFormat.Hm().format(date);

                          return Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width*0.93,
                                 height: min(MediaQuery.of(context).size.height*0.23,MediaQuery.of(context).size.height*0.6),
                                child: SingleChildScrollView(
                                                                child: Card(
                                    elevation: 10,
                                   // color: Colors.amber[50],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                        Text(
                                          'Date: ${DateFormat('yMMMd').format(date)}',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          'Range: ${documents[i]['range']}',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          'Category: ${documents[i]['veg']?'Veg':'NonVeg'} ',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                          'Description: ${documents[i]['description']}',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          'OrderConfirmeby:${documents[i]['orderconfirmed']}',
                                           style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold
                                          ),
                                        )
                                    ],
                                  ),
                                      )),
                                ),
                              ),
                              
                            ],
                          );
                        });
                  });
            }),
      ),
   );
  }
}

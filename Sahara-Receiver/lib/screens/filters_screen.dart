import 'package:flutter/material.dart';
import './donation_detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../my_flutter_app_icons.dart';
import './confirm_order_screen.dart';
import './feedback_screen.dart';

class FiltersScreen extends StatefulWidget {
  List filterKeys;
  List rangeKeys;
  FiltersScreen(this.filterKeys, this.rangeKeys);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

enum problems { badqualityfood, badservice, latedeliveries }

class _FiltersScreenState extends State<FiltersScreen> {
  problems selectedButton = problems.badqualityfood;
  var rangenumber;
  Future orderConfirm(BuildContext context) {
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              content: Text('Are you sure?'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ConfirmOrderScreen.routeName);
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

  Widget getDonorTile(int i, final documents) {
    final rangenumber = documents[i]['range'];
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DonationDetailScreen.routeName, arguments: {
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
      child: Card(
        elevation: 2.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(3),
        color: Colors.grey[50],
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
                AutoSizeText(
                  documents[i]['username'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                      items: [
                        DropdownMenuItem(
                            value: 'inappropriate',
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.report),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text('Inappropriate'),
                                ],
                              ),
                            )),
                        DropdownMenuItem(
                            value: 'feedback',
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.feedback),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text('Feedback'),
                                ],
                              ),
                            )),
                      ],
                      onChanged: (value) {
                        if (value == 'inappropriate') {
                          print('hi');
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return Container(
                                    color: Colors.black,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          width: double.infinity,
                                          height: 40,
                                          color: Colors.white,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.account_circle,
                                                color: Colors.black,
                                                size: 40,
                                              ),
                                              Text(
                                                documents[i]['username'],
                                                style: TextStyle(
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              )
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          leading: Icon(
                                            Icons.flag,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          title: Text(
                                            'Reason why you find it objectionable:',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        RadioListTile(
                                            selected: false,
                                            activeColor: Colors.white,
                                            title: Text('Bad Quality Food',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            value: problems.badqualityfood,
                                            groupValue: selectedButton,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedButton = value;
                                              });
                                            }),
                                        RadioListTile(
                                            activeColor: Colors.white,
                                            title: Text('Bad Service',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            value: problems.badservice,
                                            groupValue: selectedButton,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedButton = value;
                                              });
                                            }),
                                        RadioListTile(
                                            activeColor: Colors.white,
                                            title: Text('Late deliveries',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            value: problems.latedeliveries,
                                            groupValue: selectedButton,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedButton = value;
                                              });
                                            }),
                                        Expanded(
                                          child: Container(
                                            color: Colors.black,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: <Widget>[
                                                Text(
                                                  'Block User?',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    IconButton(
                                                        icon: Icon(
                                                          Icons.not_interested,
                                                          color: Colors.white,
                                                          size: 40,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        }),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    IconButton(
                                                        icon: Icon(
                                                          Icons.check,
                                                          color: Colors.white,
                                                          size: 40,
                                                        ),
                                                        onPressed: () {
                                                          // Scaffold.of(context).showSnackBar(SnackBar(
                                                          //  content: Text(
                                                          //'DONE',
                                                          //style: TextStyle(color: Colors.white),
                                                          //  )));
                                                          Navigator.of(context)
                                                              .pop();
                                                        })
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              });
                        }
                        if (value == 'feedback') {
                          print('in here');
                          Navigator.of(context)
                              .pushNamed(FeedbackScreen.routeName);
                        }
                      }),
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
                      color: Colors.green[900],
                    )
                  : Icon(
                      MyFlutterApp.primitive_dot,
                      size: 30,
                      color: Colors.red,
                    )
            ]),
            Row(children: [
              Icon(
                Icons.watch,
                size: 15,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Available for pickup uptil 21:00 hrs',
                style:
                    TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton.icon(
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  color: Colors.green,
                  onPressed: () {
                    orderConfirm(context);
                  },
                  label: Text(
                    'Confirm Order',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
                rangenumber = documents[i]['range'];
/***************************MAIN*/ if (widget.filterKeys.isNotEmpty &&
                    widget.rangeKeys.isEmpty) {
/****************************SUB MAIN*/ if (documents[i]
                      [widget.filterKeys[0]]) {
                    return getDonorTile(i, documents);
                  } else {
                    return Container(
                      height: 0,
                    );
                  }
                }
/*****************************MAIN*/ if (widget.filterKeys.isEmpty &&
                    widget.rangeKeys.isNotEmpty) {
/*************SUB MAIN */ if (widget.rangeKeys[0] == 2) {
                    if (documents[i]['range'] >= 4 &&
                        documents[i]['range'] <= 6) {
                      return getDonorTile(i, documents);
                    } else {
                      return Container(
                        height: 0,
                      );
                    }
                  }
                  /*************SUB MAIN */ if (widget.rangeKeys[0] == 1) {
                    if (documents[i]['range'] >= 1 &&
                        documents[i]['range'] <= 3) {
                      return getDonorTile(i, documents);
                    } else {
                      return Container(
                        height: 0,
                      );
                    }
                  }
                  /*************SUB MAIN */ if (widget.rangeKeys[0] == 3) {
                    if (documents[i]['range'] > 6) {
                      return getDonorTile(i, documents);
                    } else {
                      return Container(
                        height: 0,
                      );
                    }
                  }
                }
                //filter ke andar filter
                else {
                  if (widget.rangeKeys[0] == 2) {
                    if (documents[i]['isVeg'] &&
                        documents[i]['range'] >= 4 &&
                        documents[i]['range'] <= 6) {
                      return getDonorTile(i, documents);
                    } else {
                      return Container(
                        height: 0,
                      );
                    }
                  }
                  if (widget.rangeKeys[0] == 1) {
                    print(widget.rangeKeys[0]);
                    if (documents[i]['isVeg'] &&
                        documents[i]['range'] >= 1 &&
                        documents[i]['range'] <= 3) {
                      return getDonorTile(i, documents);
                    } else {
                      return Container(
                        height: 0,
                      );
                    }
                  }
                  //...........................
                  if (widget.rangeKeys[0] == 0) {
                    print(widget.rangeKeys[0]);
                    if (documents[i]['isVeg']) {
                      return getDonorTile(i, documents);
                    } else {
                      return Container(
                        height: 0,
                      );
                    }
                  }
                  if (widget.rangeKeys[0] == 3) {
                    print(widget.rangeKeys[0]);
                    if (documents[i]['isVeg'] && documents[i]['range'] > 6) {
                      return getDonorTile(i, documents);
                    } else {
                      return Container(
                        height: 0,
                      );
                    }
                  }
                }
              },
              itemCount: documents.length);
        },
        stream: Firestore.instance.collection('donor').snapshots());
  }
}

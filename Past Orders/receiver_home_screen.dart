import './feedback_screen.dart';

import './confirm_order_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../screens/donation_detail_screen.dart';
import '../my_flutter_app_icons.dart';

import './filters_screen.dart';

class ReceiverHomeScreen extends StatefulWidget {
  static const routeName = 'receiver-home-screen';
  @override
  _ReceiverHomeScreenState createState() => _ReceiverHomeScreenState();
}

enum problems { badqualityfood, badservice, latedeliveries }

class _ReceiverHomeScreenState extends State<ReceiverHomeScreen> {
  bool isConfirm=true;//if this is true show confirm button in donation detail screen//************CHANGES */
  problems selectedButton = problems.badqualityfood;
  List<String> filterKeys = [];
  List<int> rangeKeys = [];
  bool isRange0 = false;
  bool isRange1 = false;
  bool isRange2 = false;
  bool isRange3 = false;

  bool vegIsChecked = false;

  Widget getDonorTile(int i, final documents) {
    final rangenumber = documents[i]['range'];
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DonationDetailScreen.routeName, arguments: {
              'isConfirm':isConfirm,//************CHANGES */NOT A DB ENTRY
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
                                  Icon(Icons.flag),
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
                        if (value == 'feedback') {
                          print('in here');
                          Navigator.of(context)
                              .pushNamed(FeedbackScreen.routeName);
                        }
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
                      color: Colors.green[700],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('Welcome')),
        actions: <Widget>[
          DropdownButtonHideUnderline(
            child: DropdownButton(
                icon: Icon(
                  Icons.filter_list,
                  color: Colors.white,
                ),
                items: [
                  DropdownMenuItem(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Filters',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                  DropdownMenuItem(
                      child: Container(
                    child: Row(
                      children: <Widget>[
                        Checkbox(
                            activeColor: Colors.black,
                            checkColor: Colors.white,
                            value: vegIsChecked,
                            onChanged: (bool value) {
                              setState(() {
                                vegIsChecked = value;
                                if (vegIsChecked) {
                                  setState(() {
                                    filterKeys.add('isVeg');
                                    // FiltersScreen(filterKeys, rangeKeys);
                                  });
                                } else {
                                  setState(() {
                                    filterKeys.remove('isVeg');
                                  });
                                }
                              });
                            }),
                        Text(
                          'Veg Only',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  )),
                  DropdownMenuItem(
                    child: Container(
                        child: Row(
                      children: <Widget>[
                        Text('Range:'),
                        SizedBox(
                          width: 20,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(items: [
                            DropdownMenuItem(
                                onTap: () {
                                  setState(() {
                                    isRange1 = false;
                                    isRange2 = false;
                                    isRange3 = false;
                                    isRange0 = !isRange0;
                                  });
                                  if (isRange0) {
                                    if (rangeKeys.isNotEmpty) {
                                      setState(() {
                                        rangeKeys.removeLast();
                                      });
                                    }
                                    setState(() {
                                      rangeKeys.add(0);
                                      //FiltersScreen(filterKeys, rangeKeys);
                                    });
                                  } else {
                                    setState(() {
                                      rangeKeys.removeLast();
                                    });
                                  }
                                },
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                      fontWeight: isRange0
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                )),
                            DropdownMenuItem(
                              onTap: () {
                                setState(() {
                                  isRange0 = false;
                                  isRange2 = false;
                                  isRange3 = false;
                                  isRange1 = !isRange1;

                                  if (isRange1) {
                                    if (rangeKeys.isNotEmpty) {
                                      setState(() {
                                        rangeKeys.removeLast();
                                      });
                                    }
                                    setState(() {
                                      rangeKeys.add(1);
                                      // FiltersScreen(filterKeys, rangeKeys);
                                    });
                                  } else {
                                    setState(() {
                                      rangeKeys.removeLast();
                                    });
                                  }
                                });
                              },
                              child: Text(
                                '1-3',
                                style: TextStyle(
                                    fontWeight: isRange1
                                        ? FontWeight.bold
                                        : FontWeight.normal
                                        ),
                              ),
                            ),
                            DropdownMenuItem(
                                onTap: () {
                                  setState(() {
                                    isRange0 = false;
                                    isRange1 = false;
                                    isRange3 = false;
                                    isRange2 = !isRange2;
                                  });
                                  if (isRange2) {
                                    if (rangeKeys.isNotEmpty) {
                                      setState(() {
                                        rangeKeys.removeLast();
                                      });
                                    }
                                    setState(() {
                                      rangeKeys.add(2);
                                      // FiltersScreen(filterKeys, rangeKeys);
                                    });
                                  } else {
                                    setState(() {
                                      rangeKeys.removeLast();
                                    });
                                  }
                                },
                                child: Text(
                                  '4-6',
                                  style: TextStyle(
                                      fontWeight: isRange2
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                )),
                            DropdownMenuItem(
                                onTap: () {
                                  setState(() {
                                    isRange1 = false;
                                    isRange2 = false;
                                    isRange0 = false;
                                    isRange3 = !isRange3;
                                  });
                                  if (isRange3) {
                                    if (rangeKeys.isNotEmpty) {
                                      setState(() {
                                        rangeKeys.removeLast();
                                      });
                                    }
                                    setState(() {
                                      rangeKeys.add(3);
                                      // FiltersScreen(filterKeys, rangeKeys);
                                    });
                                  } else {
                                    setState(() {
                                      rangeKeys.removeLast();
                                    });
                                  }
                                },
                                child: Text(
                                  '>6',
                                  style: TextStyle(
                                      fontWeight: isRange3
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                ))
                          ], onChanged: (value) {}),
                        )
                      ],
                    )),
                  )
                ],
                onChanged: (_) {}),
          )
        ],
      ),
      //****************************************************************************************************** */
      body: (filterKeys.isEmpty && (rangeKeys.isEmpty || rangeKeys.contains(0)))
          ? StreamBuilder(
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
                      return getDonorTile(i, documents);
                    },
                    itemCount: documents.length);
              },
              stream: Firestore.instance.collection('donor').snapshots())
          : FiltersScreen(filterKeys, rangeKeys),
    );
  }
}

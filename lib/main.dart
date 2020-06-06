import 'package:flutter/material.dart';
import './donor_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAHARA',
      home: DonorMain(),
      // routes: {
      //   NewOrders.routeName: (ctx) => NewOrders(),
      // },
    );
  }
}



import 'package:flutter/material.dart';
import 'package:tle2/screens/tick.dart';
import './screens/add_order.dart';
import './screens/donor_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sahara',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
        accentColorBrightness: Brightness.light,
      ),
      home:DonorMain(),
      routes: {
        AddOrder.routeName : (ctx) => AddOrder(),
        DonorMain.routeName: (ctx) => DonorMain(),
        TickPage.routeName : (ctx) => TickPage(),
      },
    );
  }
}


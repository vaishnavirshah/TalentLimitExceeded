import 'package:flutter/material.dart';
import './screens/receiver_home_screen.dart';
import './screens/donation_detail_screen.dart';
import './screens/confirm_order_screen.dart';

import './screens/feedback_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        DonationDetailScreen.routeName: (ctx) => DonationDetailScreen(),
        ConfirmOrderScreen.routeName: (ctx) => ConfirmOrderScreen(),
        ReceiverHomeScreen.routeName: (ctx) => ReceiverHomeScreen(),
       
       
        FeedbackScreen.routeName:(ctx)=>FeedbackScreen(),
      },
      title: 'ReceieverHomeScreen',
      home: ReceiverHomeScreen(),
    );
  }
}

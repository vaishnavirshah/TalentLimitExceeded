import 'package:flutter/material.dart';

import './receiver_home_screen.dart';
class ConfirmOrderScreen extends StatelessWidget {
  static const routeName = 'confirm-order-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your order has been placed!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
                child: Icon(Icons.check_circle_outline,
                    size: 150, color: Colors.green)),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 1000,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(18),
              ),
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ReceiverHomeScreen.routeName);
                  },
                  child: Text(
                    'Continue Shopping',
                    style: TextStyle(fontSize: 15),
                  )),
            ),
            SizedBox(height: 4,),
             Container(
              width: 1000,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(18),
              ),
              child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Cancel Order',
                    style: TextStyle(fontSize: 15,color: Colors.white),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}

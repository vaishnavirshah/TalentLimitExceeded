import 'package:flutter/material.dart';
import './donor_main.dart';

class TickPage extends StatelessWidget {
  static const routeName = '/tick-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pushNamed(DonorMain.routeName);
          },
        ),
        title: Text('Thank you for donating!'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/tick.png")
                )
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  'Your donation is successful',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic
                  ),
                ),
                Text(
                  'Receiver will contact you shortly',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
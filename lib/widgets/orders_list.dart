import 'package:flutter/material.dart';

import '../orders.dart';

class OrdersList extends StatelessWidget {
  final List<Orders> orders;

  OrdersList(this.orders);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
        child: ListView.builder(
          itemBuilder: (ctx, index){
            return Card(
              color: Colors.black26,
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                      'Date: ${orders[index].date.toString()}',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                     ),
                      Text(
                      'Range: ${orders[index].range.toString()}',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                     ),
                      Text(
                        'Food Category: ${orders[index].isVeg }',
                        style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                        )
                      ),
                      SizedBox(height: 5,),
                      Text(
                        'Description: ${orders[index].description}',
                        style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          itemCount: orders.length,
        ),
    );
  }
}
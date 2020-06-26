import 'package:flutter/material.dart';
import '../models/orders.dart';
import 'package:intl/intl.dart';

class OrdersList extends StatelessWidget {
  final List<Orders> ord;

  OrdersList(this.ord);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 370,
      child: ListView.builder(
        itemCount: ord.length,
        itemBuilder: (ctx, i){
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[ 
                Text(
                'Date: ${DateFormat('yMMMd').format(DateTime.now())}',
                style: TextStyle(
                  fontSize: 20,
                ),
                ),
                Text(
                'Range: ${ord[i].range.toString()}',
                style: TextStyle(
                  fontSize: 20,
                ),
                ),
                Text(
                  'Category: ${ord[i].isVeg ? 'Veg': 'Non-Veg'} ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Description: ${ord[i].description}',
                  style: TextStyle(
                  fontSize: 20,
                  ),
                ),
              ],
            )
          );  
        }
      ),
    );
  }
}
       
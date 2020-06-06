import 'package:flutter/foundation.dart';
class Orders{
  final String isVeg;
  final String description;
  final double range;
  final String date;

  Orders({
    @required this.isVeg,
    @required this.description,
    @required this.range,
    this.date,
  });

  // void addOrd(Orders ord){
  //   final newOrd = Orders(
  //     range: ord.range,
  //     description: ord.description,
  //     isVeg: ord.isVeg,
  //     date: DateFormat('yMMMd').format(DateTime.now()).toString(),
  //   );
  // }

}
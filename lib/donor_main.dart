import 'package:flutter/material.dart';
import './widgets/new_orders.dart';
import './widgets/orders_list.dart';
import './orders.dart';
import './full_screen.dart';

class DonorMain extends StatefulWidget {
  
  @override
  _DonorMainState createState() => _DonorMainState();
}

class _DonorMainState extends State<DonorMain> {

  final List<Orders> _userOrders = [
  ];
  
  //Widget buildSheetLogin(BuildContext context) { return new Container( ....... ); }

  void addNewOrders(double nrange, String ndescription, String nveg, String ndate){
    final newOrd = Orders(
      range:nrange, 
      description: ndescription, 
      isVeg: nveg,
      date: ndate,
    );

    setState(() {
      _userOrders.add(newOrd);
    });
  }

  void _addButton(BuildContext ctx) { 
    showModalBottomSheetApp( context: ctx, builder: (bctx) { 
    return GestureDetector(
      child: NewOrders(addNewOrders),
      onTap: (){},
      behavior: HitTestBehavior.opaque,
      );}); }

// void _addButton(BuildContext ctx){
//     showModalBottomSheet(
//       context: ctx, 
//       builder: (bctx){
//         return GestureDetector(
//         child: NewOrders(addNewOrders),
//         onTap: (){},
//         behavior: HitTestBehavior.opaque,
//         );
//       }
//     );
//  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'SAHARA', 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic
            ),
          ),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              color: Colors.white70,
              // onPressed: (){
              //   Navigator.of(context).pushNamed(NewOrders.routeName);
              // },
              onPressed: () => _addButton(context),
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.black87,
            child: Column(
              children: <Widget>[
                Container(
                  height: 120,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Options',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 25
                  ),
                  title: Text(
                    'Profile',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    ),
                  ),
                  onTap: (){},
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                    size: 25,
                  ),
                  title: Text(
                    'Logout',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    ),
                  ),
                  onTap: (){},
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dst),
              image: AssetImage("images/smile.jpg"),
            fit: BoxFit.cover,
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(  
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    color: Colors.black26,
                    child: Text(
                      'Donations:  ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                OrdersList(_userOrders),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.grey[200],
          ),
          // onPressed: (){
          //       Navigator.of(context).pushNamed(NewOrders.routeName);
          // },
          onPressed: () => _addButton(context),
          backgroundColor: Colors.black,
        ),
      );
  }
}
import 'package:flutter/material.dart';
import './screens/donor_main.dart';
import './screens/receiver_home_screen.dart';

class TCpage extends StatefulWidget {
  bool isDonor;
  TCpage(this.isDonor);
  @override
  _TCpageState createState() => _TCpageState();
}

class _TCpageState extends State<TCpage> {
  @override
  Widget build(BuildContext context) 
  {
     return Scaffold
    (
      appBar: AppBar
      (
        titleSpacing: 0,
        elevation: 20,
        backgroundColor: Colors.pink,
        title:Text('Terms and Conditions',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
      ),
        body: Container(
          color:Colors.amber[100],
          child: Column
      (
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>
          [
            
            Container(
              
             // color:Colors.amber[200],
            child: Expanded
              (
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                     child: Column
                    (
                      children: <Widget>
                      [
                        SizedBox(height:10),
                        Text('t1'),
                          Divider(),
                          Text('t2'),
                          Divider(),
                          Text('t3'),
                          Divider(),
                        
                      ],
                    ),
                  ),
                )
              ),
            ),

            Container
            (
              width: double.infinity,
              color: Colors.black,
              child: Column
              (
                children: <Widget>
                [
                  SizedBox(height:10),
                    Text('I agree with all the above mentioned Terms and Conditions.',style:TextStyle(color:Colors.white)),
                    SizedBox(height: 15,),
                    FlatButton.icon
                    (
                          color:Colors.white,
                          splashColor: Colors.pink,
                          icon: Icon(Icons.check_circle_outline),
                          onPressed: () 
                          {
                              
                          if(widget.isDonor)
                          {
                            Navigator.of(context).pushNamed(DonorMain.routeName);
                          }
                          else{
                            Navigator.of(context).pushNamed(ReceiverHomeScreen.routeName);
                            }
                          },
                          label: Text('I  Agree.',style:TextStyle(color:Colors.black,fontWeight: FontWeight.w700) )
                    ),
                    SizedBox(height: 10,),

                ],
              ),
            )
          ],  
      ),
        ),
    );
  }
}

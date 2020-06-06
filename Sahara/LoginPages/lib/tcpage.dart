import 'package:flutter/material.dart';


class TCpage extends StatefulWidget {
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
        backgroundColor: Colors.pink,
        title:Text('Terms and Conditions',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold),textAlign:TextAlign.center),
      ),
        body: Column
      (
        children: <Widget>
        [
          Container
          (
            padding: EdgeInsets.all(20),
            width:MediaQuery.of(context).size.width*1,
            height:MediaQuery.of(context).size.height*0.7,
            child:SingleChildScrollView
            (
              child: Column
              (
                children: <Widget>
                [
                  Text('T1'),
                  Divider(),
                  Text('T2'),
                  Divider(),
                  Text('T3'),
                  Divider(),
                  Text('T4'),
                  Divider(),
                ],
              ),
            )
          ),
          Container
          (
            width: MediaQuery.of(context).size.width*1,
            height:MediaQuery.of(context).size.height*0.182,
            color:Colors.black,
            padding: EdgeInsets.all(10),
            child:Column
            (
            
              children:<Widget> 
              [
                SizedBox(height:10),
                Text('I agree with all the above mentioned Terms and Conditions.',style:TextStyle(color:Colors.white)),
                SizedBox(height: 15,),
                FlatButton.icon
                (
                  color:Colors.white,
                  splashColor: Colors.pink,
                  icon: Icon(Icons.check_circle_outline),
                  onPressed: () {},
                  label: Text('I  Agree.',style:TextStyle(color:Colors.black,fontWeight: FontWeight.w700) )
                ),
              ],
             

              
            )

          ),
        ],  
      ),
    );
  }
}
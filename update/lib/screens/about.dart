import 'package:flutter/material.dart';
import 'package:sahara/screens/receiver_home_screen.dart';
//import './donor_main.dart';
//import './add_order.dart';

class AboutUs extends StatelessWidget {
  static const routeName = '/about-us';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()
            {
               Navigator.of(context).popAndPushNamed(ReceiverHomeScreen.routeName);
            }
       
        ),
        title: Text('About Sahara'),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/auth.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
             
                               Container(
                  height: MediaQuery.of(context).size.height*0.1,
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Center(
                    child: Card(
                      color: Colors.black26,
                      child: Text(
                        'SAHARA - सहारा :',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox( height: MediaQuery.of(context).size.height*0.035,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                   height: MediaQuery.of(context).size.height*0.2,
                  child: Card(
                    color: Colors.black26,
                    child: Text(
                      'Something that sustains you, supports you by giving you help, strength, or encouragement.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:32,
                       // fontStyle: FontStyle.bold,
                      ),
                    ),
                  ),
                ),
              ),
             SizedBox( height: MediaQuery.of(context).size.height*0.015,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Card(
                    color: Colors.black26,
                    child: Text(
                      'This organisation works to connect the avaliable donors to recpients who can provide the needy.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ),
            
             SizedBox( height: MediaQuery.of(context).size.height*0.015,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Card(
                    color: Colors.black26,
                    child: Text(
                      'help us in our journey to help others',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:32,
                   //    fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
            
            ],
          ),
        ),
      ),
    );
  }
}
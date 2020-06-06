//import 'package:app1/welcome_page.dart';


import 'package:flutter/material.dart';
import 'package:sahara/spashScreen.dart';



//import './sign_up.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
     (
      
          title: 'Sahara',
          theme: ThemeData
          (
            fontFamily: 'Raleway',
          ),
          home: SplashScreen(),

    );
  }
}
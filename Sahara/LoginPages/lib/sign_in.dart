import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_signin_button/button_view.dart';
import './sign_up.dart';
//import './error.dart';


class SignIn extends StatefulWidget 
{
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
     bool _showPwd =true;
    final pwd=TextEditingController();
    bool hasUppercase;
    bool hasDigits;
    bool hasLowercase;
    bool hasSpecialCharacters;
    final _formKey =GlobalKey<FormState>();
    bool isLoading=false;
    var _userEmail='';
    var _userPasswrod='';

    
   
    
   void password()
   {
    setState(() 
    {
     _showPwd =!_showPwd; 
    }); 
   
   }

   
  void validation()
   {
     
   hasUppercase = (pwd.text).contains(new RegExp(r'[A-Z]'));
   hasDigits = (pwd.text).contains(new RegExp(r'[0-9]'));
   hasLowercase = (pwd.text).contains(new RegExp(r'[a-z]'));
   hasSpecialCharacters = (pwd.text).contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
   if(hasDigits & hasUppercase & hasLowercase & hasSpecialCharacters )
   {
     return;
   }
    showDialog
    (
      context: context,
      
      builder:(ctx)
      {
        return AlertDialog
        (
          elevation: 10,
         
          content: FittedBox
          (
            child:Column
            (
              children: <Widget>
              [
              Text('  Passwords must have :',style:TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
              SizedBox(height:10),
              Text('   1. Atleast one Uppercase letter ',style:TextStyle(fontSize:16)),
              SizedBox(height:  5),
              Text('    2. Atleast one Lowercase letter ',style:TextStyle(fontSize:16)),
              SizedBox(height:5),
              Text('    3. Atleast one Special character',style:TextStyle(fontSize:16)),
              SizedBox(height:5),
              Text('    4. Atleast one number from 0-9!',style:TextStyle(fontSize:16)),
              SizedBox(height:10),
              IconButton
              (
                icon: Icon(Icons.arrow_back),
                 onPressed: ()
                 {
                   Navigator.of(context).pop();
                 }
              )
             
              ],

            )
          ),
        );
      }
    );

   }

   void save()
   {
     final isValid= _formKey.currentState.validate();
     FocusScope.of(context).unfocus();
     
     if(isValid)
     {
       _formKey.currentState.save();
     }
   }


 

  @override
  Widget build(BuildContext context) {
    return  Scaffold
      (
          body:  new GestureDetector  
                  (
                    onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
        child: Container
       (
        height:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        decoration: BoxDecoration
        (
            image:DecorationImage(image:AssetImage("image/auth.jpg"),fit:BoxFit.cover,),
            
        ),
        
              child: Container
              (
                padding:EdgeInsets.all(25),
               
               
                color:Colors.white70,
                
                child: SingleChildScrollView
                (
                   // child: Expanded
                    //(

                    child: Form
                    (
                      key:_formKey,
                      child: Column
                        (
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>
                      [

                          SizedBox
                          (
                              height:MediaQuery.of(context).size.height*0.16,
                          ),


                           Center(child:Text('Login to your account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18))),   
                         
                          SizedBox
                          (
                              height:MediaQuery.of(context).size.height*0.09,
                          ),

                          TextFormField
                          (
                          initialValue: null,
                          decoration: InputDecoration(labelText: 'Email'),
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                          textInputAction: TextInputAction.next,
                          validator: (value ) 
                          {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Please provide a value.';
                          }
                          return null;
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).unfocus();
                          _userEmail=value;
                           FocusScope.of(context).unfocus();
                            },
                          ),

                          
                          TextFormField
                          (
                          initialValue: null,
                          controller: pwd,
                          decoration: InputDecoration
                               (
                                labelText: '*Password',
                                suffixIcon: IconButton
                                 (
                                icon: _showPwd?Icon(Icons.visibility_off):Icon(Icons.visibility,color:Colors.blue),
                                onPressed: ()=> password(),
                                 )
                               ),
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                              obscureText: _showPwd,
                            
                          textInputAction: TextInputAction.next,
                          validator: (value) 
                          {
                          if (value.isEmpty) {
                            return 'Please provide a value.';
                          }
                          return null;
                          },
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).unfocus();
                          validation();
                           _userPasswrod=value;
                            
                            },
                            onSaved: (value)
                            {
                               validation();
                           _userPasswrod=value;
                            
                            },
                            
                          ),
                        
                          
                          
                          SizedBox
                          (
                            height: 20,
                          ),

                          
                          Row
                          (
                            children: <Widget>
                            [
                               Container
                              (
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black),
                                margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.03),
                                child: FlatButton
                                (
                                  onPressed: () 
                                  {
                                    FocusScope.of(context).unfocus();
                                  save();
                                  },
                                  child: Column
                                  (
                                    children: <Widget>
                                    [
                                      Text
                                      (
                                        'Log In',
                                        textAlign: TextAlign.center,
                                        style:TextStyle(fontSize:20,fontWeight: FontWeight.w500,color:Colors.white)
                                      ),
                                      SizedBox(height:3),
                                      Text
                                      (
                                        'Continue Helping..',
                                        textAlign: TextAlign.center,
                                        style:TextStyle(fontSize: 12,color:Colors.white,),
                                      )  
                                    ],
                                  ),
                                ),
                              ),
                              Container
                              (
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black),
                                margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.03),
                                child: FlatButton
                                (
                                  onPressed: () 
                                  {
                                    FocusScope.of(context).unfocus();
                                  Navigator.of(context).push(MaterialPageRoute
                                  (
                                    builder: (ctx)=>SignUp()
                                  ));
                                  },
                                  child: Column
                                  (
                                    children: <Widget>
                                    [
                                      Text
                                      (
                                        'New user?',
                                        textAlign: TextAlign.center,
                                        style:TextStyle(fontSize:20,fontWeight: FontWeight.w500,color:Colors.white)
                                      ),
                                      SizedBox(height:3),
                                      Text
                                      (
                                        'Create a new account',
                                        textAlign: TextAlign.center,
                                        style:TextStyle(fontSize: 12,color:Colors.white,),
                                      )  
                                    ],
                                  ),
                                ),
                              ),

                     
                         
                            ],
                          ),

                           SizedBox
                          (
                            height: 10,
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>
                            [
                              Container
                              (
                                 child: Text
                                 (
                                  'Try Other Options',
                                   style:TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.bold), 
                                 ),
                              ),

                             SignInButton
                             (
                               Buttons.AppleDark,
                               mini:true,
                               onPressed: () {},
                             ), 

                             SignInButton
                             (
                               Buttons.Facebook,
                               mini:true,
                               onPressed: () {},
                             ),

                             SignInButton
                             (
                               
                               Buttons.Twitter,
                               mini: true,
                               onPressed: () {},
                             ), 
                            ],
                          ), 
                      ],
            ),
                        ),
                   // ),
                ),
              ),
     // ),
        
        ),
          ),
    );
      
    
  }
}
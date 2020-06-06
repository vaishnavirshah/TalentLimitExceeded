import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_signin_button/button_view.dart';
import './tcpage.dart';




class SignUp extends StatefulWidget
 {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> 
{
    bool _showPwd =true;
    final pwd=TextEditingController();
    final cnfrmpwd=TextEditingController();
    bool hasUppercase;
    bool hasDigits;
    bool hasLowercase;
    bool hasSpecialCharacters;
    final _formKey =GlobalKey<FormState>();
    bool isLoading=false;
    var _userName='';
    var _userEmail='';
    var _userPasswrod='';
   bool isDonor;
   int count=0;
    bool isResto=false;
    bool isCaterer=false;
    bool isIndividual=false;
    String restoAddress='';
    String restoName='';
    String catererAddress='';
    String catererName='';

    
   
    
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



   void saveAll()
   {
     final isValid= _formKey.currentState.validate();
     FocusScope.of(context).unfocus();
          
     if(isValid)
     {
       _formKey.currentState.save();
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>TCpage()));
     }
   }


 

  @override
  Widget build(BuildContext context) {
    return  Scaffold
      (
          body: new GestureDetector  
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
               
               
                color:Colors.white60,
                
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
                              height:MediaQuery.of(context).size.height*0.15,
                          ),

                          TextFormField
                          (
                          initialValue: null,
                          decoration: InputDecoration(labelText: 'Name'),
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                          textInputAction: TextInputAction.next,
                          validator: (value) 
                          {
                          if (value.isEmpty) {
                            return 'Please provide a value.';
                          }
                          return null;
                          },
                          onFieldSubmitted: (value) {
                          _userName=value;
                           FocusScope.of(context).unfocus();
                            },
                          ),

                          
                         
                          TextFormField
                          (
                          initialValue: null,
                          decoration: InputDecoration(labelText: 'Email'),
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                          textInputAction: TextInputAction.next,
                          
                          validator: (value) 
                          {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Please provide a value.';
                          }
                          return null;
                          },
                          onFieldSubmitted: (value) {
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
                          validation();
                           _userPasswrod=value;
                            FocusScope.of(context).unfocus();
                            },
                            onSaved: (value)
                            {
                               validation(); 
                               _userPasswrod=value; 
                            },
                          ),
                          

 

                             
                          TextFormField
                          (
                          initialValue: null,
                          controller: cnfrmpwd,
                          decoration: InputDecoration
                               (
                                labelText: '* Confirm Password',
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
                          if (value.isEmpty ) {
                            return 'Please provide a value.';
                          }
                          if(value!=pwd.text)
                          { return 'Passwrods do not match!' ;}
                          return null;
                          },
                          onFieldSubmitted: (_)
                          {
                           FocusScope.of(context).unfocus();
                          },
                          onSaved: (value)
                            {
                               validation();  
                            },
                          ),

                          count==1?
                          Column
                          (
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>
                            [
                              SizedBox(height: 10,),
                              Text('What are you?',style:TextStyle(fontSize:18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                              CheckboxListTile
                              (
                                title: Text("Restaurant",style: TextStyle(fontWeight: FontWeight.bold)),
                                value:  isResto,
                                onChanged: (newValue) { 
                                setState(() {
                                isResto = !isResto; 
                                }); 
                                },
                                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                              ),
                               CheckboxListTile
                              (
                                title: Text("Caterer",style: TextStyle(fontWeight: FontWeight.bold)),
                                value:  isCaterer,
                                onChanged: (newValue) { 
                                setState(() {
                                isCaterer = !isCaterer; 
                                }); 
                                },
                                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                              ),
                               CheckboxListTile
                              (
                                title: Text('Individual',style: TextStyle(fontWeight: FontWeight.bold)),
                                value:  isIndividual,
                                onChanged: (newValue) { 
                                setState(() {
                                isIndividual = !isIndividual; 
                                }); 
                                },
                                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                              ),

                              isResto?Column
                              (
                                children: <Widget>
                                [
                                  TextFormField
                                  (
                                    decoration: InputDecoration(labelText:'Restaurant name',labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                    onFieldSubmitted: (value)
                                    {
                                    restoName=value;
                                    FocusScope.of(context).unfocus();

                                    },
                                
                                  ),

                                  TextFormField
                                  (
                                    decoration: InputDecoration(labelText:'Address',labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                    onFieldSubmitted: (value)
                                    {
                                      restoAddress=value;
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ],
                              ):Text(''),

                              isCaterer?Column
                              (
                                children: <Widget>
                                [
                                  TextFormField
                                  (
                                    decoration: InputDecoration(labelText:'Caterer name',labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                    onFieldSubmitted: (value)
                                    {
                                    catererName=value;
                                    FocusScope.of(context).unfocus();
                                    },
                                    validator: (value)
                                    {
                                      if(value.isEmpty)
                                      return ' Enter a valid name';
                                      return null;
                                    },
                                  ),

                                  TextFormField
                                  (
                                    decoration: InputDecoration(labelText:'Address',labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                    onFieldSubmitted: (value)
                                    {
                                      catererAddress=value;
                                      FocusScope.of(context).unfocus();
                                    },
                                    validator: (value)
                                    {
                                      if(value.isEmpty)
                                      return 'Enter valid adress';
                                      return null;
                                    },
                                  ),
                                ],
                              ):Text(''),
                            ],


                          ):Text(''),
                          

                          count==-1?Column
                          (
                            children: <Widget>
                            [
                              TextFormField
                              (
                                decoration:InputDecoration(labelText:'Question 1',labelStyle: TextStyle(fontSize:18,fontWeight:FontWeight.bold))
                              ),
                               TextFormField
                              (
                                decoration:InputDecoration(labelText:'Question 2',labelStyle: TextStyle(fontSize:18,fontWeight:FontWeight.bold))
                              )
                            ],
                          ):Text(''),
                          
                          SizedBox
                          (
                            height: 10,
                          ),

                          Row
                          (
                            children: <Widget>
                            [
                              if(count==0)
                               Container
                              (
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black),
                                margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.06),
                                child: FlatButton
                                (
                                  onPressed: () 
                                  {
                                    FocusScope.of(context).unfocus();
                                    setState(() 
                                    {
                                      isDonor=false;
                                     count=-1;
                                    });
                                    _formKey.currentState.validate();
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Column
                                  (
                                    children: <Widget>
                                    [
                                      Text
                                      (
                                        'Sign Up',
                                        textAlign: TextAlign.center,
                                        style:TextStyle(fontSize:20,fontWeight: FontWeight.w500,color:Colors.white)
                                      ),
                                      Text
                                      (
                                        'Start Recieving..',
                                        textAlign: TextAlign.center,
                                        style:TextStyle(fontSize: 12,color:Colors.white,),
                                      )  
                                    ],
                                  ),
                                ),
                              ),
                              if(count==0)
                              Container
                              (
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black),
                                margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.06),
                                child: FlatButton
                                (
                                  onPressed: () 
                                  {
                                    FocusScope.of(context).unfocus();
                                    setState(() {
                                      isDonor=true;
                                     count=1;
                                    });
                                    _formKey.currentState.validate();
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Column
                                  (
                                    children: <Widget>
                                    [
                                      Text
                                      (
                                        'Sign Up',
                                        textAlign: TextAlign.center,
                                        style:TextStyle(fontSize:20,fontWeight: FontWeight.w500,color:Colors.white)
                                      ),
                                      Text
                                      (
                                        'Start Donating..',
                                        textAlign: TextAlign.center,
                                        style:TextStyle(fontSize: 12,color:Colors.white,),
                                      )  
                                    ],
                                  ),
                                ),
                              ),

                              if(count!=0)
                               Container
                              (
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black),
                                margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.25),
                                child: FlatButton
                                (
                                  onPressed: () 
                                  {
                                    FocusScope.of(context).unfocus();
                                    setState(() {
                                      isDonor=true;
                                     count=3;
                                    });
                                  saveAll();
                                  },
                                  child: Column
                                  (
                                    children: <Widget>
                                    [
                                      Text
                                      (
                                        'Sign Up',
                                        textAlign: TextAlign.center,
                                        style:TextStyle(fontSize:20,fontWeight: FontWeight.w500,color:Colors.white)
                                      ),
                                      Text
                                      (
                                        'Start helping..',
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
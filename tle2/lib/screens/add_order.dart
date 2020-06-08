import 'package:flutter/material.dart';
import 'package:tle2/screens/tick.dart';
import './donor_main.dart';

class AddOrder extends StatefulWidget {
  static const routeName = '/add-order';
  @override
  _AddOrderState createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  final rangeIp = TextEditingController();
  final descripIp = TextEditingController();
  bool isVege = false;
  bool isNVeg = false;
  final _descriptionFN = FocusNode();


  bool _checkboxValid(){
    if(isVege == isNVeg){
      return  false;
    } 
    return true;
  }

  bool _validateInputs() {
    if(!_checkboxValid() ){
      return false;
    } 
    if (_formKey.currentState.validate()) {
    //    If all data are correct then save data to out variables
        _formKey.currentState.save();
        return true;
    } else {
    //    If all data are not valid then start auto validation.
      setState(() {
          _autoValidate = true;
        });
      return false;
    }
  }

  void submit(){
    
    Navigator.of(context).pushNamed(TickPage.routeName);
  }
  @override

  void dispose() {
    _descriptionFN.dispose();
    super.dispose();
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pushNamed(DonorMain.routeName);
          },
        ),
        title: Text('Donate Now'),
      ),
      body: Container(
        height: 500,
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10,),
              TextFormField(
                controller: rangeIp,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(15.0),
                  labelText: 'Range',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (val){
                  if(val.isEmpty || double.parse(val) <= 0){
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onFieldSubmitted:(_) {
                  FocusScope.of(context).requestFocus(_descriptionFN);
                },
              ),
              SizedBox(height: 10),
              Text('Food Category: '),
              CheckboxListTile(
                title: Text('Veg: '),
                value: isVege,
                onChanged: (value) {
                  setState(() {
                    isVege = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text(
                'Non-Veg: '
                ),
                value: isNVeg,
                onChanged: (value) {
                  setState(() {
                    isNVeg = value;
                  });
                },
              ),
              Text(
                'Select any ONE checkbox',
                style: TextStyle(
                  fontSize: 10,
                  color: _checkboxValid() ? Colors.transparent : Colors.red[900],
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                focusNode: _descriptionFN,
                maxLines: 3,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(15.0),
                  labelText: 'Description',
                ),
                controller: descripIp,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.multiline,
                validator: (val){
                  if(val.isEmpty){
                    return 'Please enter valid description';
                  }
                  return null;
                },
              ),
              FlatButton.icon(
                color: Colors.blueGrey[100],
                onPressed: (){
                if ( _validateInputs()){
                  return showDialog(
                   context: context,
                   builder: (context) {
                    return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                      content: Text(
                        'Are you sure?',
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('No'),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('Yes'),
                          onPressed: submit,
                        ),
                      ],
                    );
                  },
                );
                } else{
                  return null;
                }
                },
                icon: Icon(Icons.group_add), 
                label: Text('Donate'),  
              ),
            ],
          ),
        ),
      ),
    );
  }
}
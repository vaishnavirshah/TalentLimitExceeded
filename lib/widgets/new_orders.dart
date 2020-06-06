import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewOrders extends StatefulWidget {
  //static const routeName = '/new-order';

  final Function addOrd;

  NewOrders(this.addOrd);

  @override
  _NewOrdersState createState() => _NewOrdersState();
}

class _NewOrdersState extends State<NewOrders> {
  final _vegFN = FocusNode();
  final _descriptionFN = FocusNode();

  final rangeIp = TextEditingController();

  final vegIp = TextEditingController();

  final descriptionIp = TextEditingController();

  final  _form = GlobalKey<FormState>();
  // var _editedOrder = Orders(
  //   range: null,
  //   description: '',
  //   isVeg: '',
  // );

  // void _saveForm(){
  //   final isValid = _form.currentState.validate();
  //   if(!isValid){
  //     return;
  //   }
  //   _form.currentState.save();
  // }

  void submit() {
    if (double.parse(rangeIp.text) <= 0 ||
        descriptionIp.text.isEmpty ||
        vegIp.text.isEmpty) {
      return;
    }
    // AlertDialog(
    //   title: Text('To confirm donation'),
    //   content: SingleChildScrollView(
    //     child: ListBody(
    //       children: <Widget>[
    //         Text('Do you agree with the t/c?'),
    //       ],
    //     ),
    //   ),
    //   actions: <Widget>[
    //     FlatButton(
    //       child: Text('Agree'),
    //       onPressed: () {
    //         widget.addOrd(
    //           double.parse(rangeIp.text),
    //           descriptionIp.text,
    //           vegIp.text,
    //           // DateFormat.yMMMd().format(DateTime.now())
    //           DateFormat('yMMMd').format(DateTime.now()).toString(),
    //         );
    //       },
    //     ),
    //     FlatButton(
    //       child: Text('Diagree'),
    //       onPressed: () {
    //         Navigator.of(context).pop();
    //       },
    //     ),
    //   ]
    // );
    final isValid = _form.currentState.validate();
      if(!isValid){
       return;
      }
    widget.addOrd(
      double.parse(rangeIp.text),
      descriptionIp.text,
      vegIp.text,
      // DateFormat.yMMMd().format(DateTime.now())
      DateFormat('yMMMd').format(DateTime.now()).toString(),
    );
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _vegFN.dispose();
    _descriptionFN.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(
            'Donate Now', 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              color: Colors.white70,
              onPressed: submit,
            ),
          ],
          backgroundColor: Colors.black,
      ),
     // child: Padding(
      body: Container(
          height: 700,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dst),
                image: AssetImage("images/smile.jpg"),
              fit: BoxFit.cover,
              )
            ),
          child: Form(
            key: _form,
            //child: SingleChildScrollView(
              child: ListView(
                children: <Widget>[  
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Range',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white70
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      )
                    ),
                    textInputAction: TextInputAction.next,
                    cursorColor: Colors.white70,
                    keyboardType: TextInputType.number,
                    // onSaved: (value){
                    //   _editedOrder =Orders(
                    //     range: double.parse(value),
                    //     description: _editedOrder.description,
                    //     isVeg: _editedOrder.isVeg,
                    //     date: DateFormat('yMMMd').format(DateTime.now()).toString(),
                    //   );
                    // },
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_vegFN);
                    },
                     validator: (value){
                       if(value.isEmpty || double.parse(value) <= 0){
                         return 'Please enter a valid number';
                       }
                       return null;
                     },
                    controller: rangeIp,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Veg/NonVeg',
                    ),
                    textInputAction: TextInputAction.next,
                    controller: vegIp,
                    focusNode: _vegFN,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_descriptionFN);
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please enter valid information';
                      }
                      return null;
                    },
                    // onSaved: (value){
                    //   _editedOrder =Orders(
                    //     range: _editedOrder.range,
                    //     description: _editedOrder.description,
                    //     isVeg: value,
                    //     date: DateFormat('yMMMd').format(DateTime.now()).toString(),
                    //   );
                    // },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    textInputAction: TextInputAction.next,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    controller: descriptionIp,
                    focusNode: _descriptionFN,
                    // onSaved: (value){
                    //   _editedOrder =Orders(
                    //     range: _editedOrder.range,
                    //     description: value,
                    //     isVeg: _editedOrder.isVeg,
                    //     date: DateFormat('yMMMd').format(DateTime.now()).toString(),
                    //   );
                    // },
                    onFieldSubmitted: (_) => submit,
                     //onFieldSubmitted: (_) => _saveForm,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please enter valid information';
                      }
                      return null;
                    },

                  ),
                  FlatButton(
                    color: Colors.black45,
                    child: Text('Add donation'),
                    textColor: Colors.white,
                    onPressed: submit,
                  )
                ],
              ),
            // ),
          ),
        ),
     // ),
    );
  }
}

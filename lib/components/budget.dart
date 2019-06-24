import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class MyMoney extends StatefulWidget {
  final int budget;
  final int expense;
  MyMoney({Key key, this.budget, this.expense}) : super(key: key);
  @override
  _MyMoneyState createState() {
    return _MyMoneyState();
  }
}

class _MyMoneyState extends State<MyMoney> {
  final amountFormatter = NumberFormat.currency(
    locale: 'id_ID',
    name: 'IDR',
    decimalDigits: 0,
    symbol: 'Rp ',
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.monetization_on
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'My Money',
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
              )
            ],
          ),
          Divider(),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.monetization_on,
                          color: Colors.lightGreen,
                          size: 50,
                        ),
                        Text(
                          amountFormatter.format(this.widget.budget),
                          style: TextStyle(
                            fontSize: 20
                          ),
                        )
                      ],
                    )
                  ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.money_off,
                        color: Colors.redAccent,
                        size: 50,
                      ),
                      Text(
                        amountFormatter.format(this.widget.expense),
                        style: TextStyle(
                          fontSize: 20
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
          ),
          Divider(),
          FlatButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InputTransaction())
                  );
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add_circle,
                      color: Colors.green,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        'Add New Transaction',
                        style: Theme.of(context).textTheme.subhead,
                      )
                    )
                  ],
                )
            ),
        ],
      ),
    );
  }
}

class InputTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputTransactionState();
  }

}

class _InputTransactionState extends State<InputTransaction>{
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Input New Transaction'),
        centerTitle: true,
      ),
      body: Container(
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    enabled: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter a search term',
                      labelText: 'Enter amount',
                    ),
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please enter some text';
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      color: Theme.of(context).buttonColor,
                      onPressed: (){
                        if(_formKey.currentState.validate()){

                        }
                      },
                      child: Text(
                          'Submit',
                      ),
                    ),
                  )
                ],
              )
          )
      ),
    );
  }

}

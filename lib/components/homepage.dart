import 'package:flutter/material.dart';
import 'budget.dart';
import 'transaction.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PFM', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Card(
                child: MyMoney(budget: 1000000, expense: 1000,),
              ),
              Card(
                child: TransactionList(),
              )
            ],
          ),
        )
      ),
    );
  }

}
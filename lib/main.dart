import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import './components/transaction_form.dart';
import './components/transaction_list.dart';
import 'dart:math';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _transactions = [
    Transaction(id: 't1', title: 'teste1', value: 110, date: DateTime.now()),
    Transaction(id: 't2', title: 'teste2', value: 210, date: DateTime.now())
  ];

  _addTransaction(String title, double value) {
    final newTransaction = new Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());    

    setState(() {
      _transactions.add(newTransaction);    
    });

    Navigator.of(context).pop();
    
  }

  _removeTransaction(String id) {    
    setState(() {
      _transactions.removeAt(_transactions.indexWhere((element) => element.id == id));
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_) {
      return TransactionForm(_addTransaction);
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Despesas pessoais'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Card(
                  color: Colors.blue,
                  child: Text('gráfico'),
                  elevation: 5,
                ),
              ),
              Column(
                children: [                  
                  TransactionList(_transactions, _removeTransaction),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {_openTransactionFormModal(context)},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

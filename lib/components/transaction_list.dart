import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final void Function(String) removeFromList;

  TransactionList(this.transactions, this.removeFromList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index) {
            final e = transactions[index];
            return Card(
              child: ListTile(
                leading: Icon(
                  Icons.attach_money,
                  size: 40,
                ),
                title: Text(
                  'R\$ ${e.value.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  '${e.title} \n${DateFormat('d/MM/y').format(e.date)}',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                isThreeLine: true,
                dense: true,
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    removeFromList(e.id);
                  },
                ),
              ),
            );
          }),
    );
  }
}

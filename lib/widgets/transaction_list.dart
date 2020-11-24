import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: transactions.isEmpty
          ? Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Add items.',
                    style: TextStyle(
                      // fontFamily: 'Raleway',
                      fontSize: 35,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset('assets/images/cat.gif'),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'No one wants to play with me...',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.blue[800],
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

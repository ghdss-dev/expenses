import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: transactions.isEmpty ? LayoutBuilder(
        builder: (ctx, constraints) {
         return Column(
            children: <Widget>[
              SizedBox(height: 20),

              Text(
                'Nenhuma Transação Cadastrada !',
                style: Theme.of(context).textTheme.titleLarge,
              ),

              SizedBox(height: 20),

              Container(
                height: constraints.maxHeight * 0.6,
                child:  Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          );
        },
      ) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: FittedBox(
                      child: Text('R\$${tr.value}'),
                    ),
                  ),
                ),
                title: Text(
                  tr.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  DateFormat('d MMM y').format(tr.date),
                ),
                trailing: MediaQuery.of(context).size.width > 480 ? ElevatedButton.icon(
                  onPressed: () => onRemove(tr.id),
                  icon: Icon(Icons.delete),
                  label: Text('Excluir'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Cor de fundo do botão
                    onPrimary: Theme.of(context).textTheme.button!.color, // Cor do texto do botão
                  ),
                ) : IconButton(
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => onRemove(tr.id),
                )
              )
          );
        },
      )
    );
  }
}

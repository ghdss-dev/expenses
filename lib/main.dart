import 'dart:math';
import 'dart:io';
import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/transaction_list.dart';

import 'models/transaction.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {

  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /*SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);*/

    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.white,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          toolbarTextStyle: ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
          ).bodyText2, titleTextStyle: ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
          ).headline6
        )
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key : key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _transactions = [
  ];

  bool _showChart = !false;

  Iterable<Transaction> get _recentTransactions {

    return _transactions.where((tr) {

      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));

    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {

    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }
  
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  Widget _getIconButton(IconData icon, VoidCallback? onPressed) {
    return Platform.isIOS
        ? GestureDetector(onTap: onPressed, child: Icon(icon))
        : IconButton(icon: Icon(icon), onPressed: onPressed);
  }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final iconList = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final charList = Platform.isIOS ? CupertinoIcons.refresh : Icons.show_chart;

    final actions = <Widget>[
      if (isLandscape)
        _getIconButton(
            _showChart ? iconList : charList,
             () {
              setState(() {
                _showChart = !_showChart;
              });
            }
        ),

      _getIconButton(
       Platform.isIOS ? CupertinoIcons.add :  Icons.add,
            () => _openTransactionFormModal(context),
      ),
    ];

    final Widget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
      middle: Text('Despesas Pessoais'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: actions,
      ),
    ) : AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          fontSize: 20 * mediaQuery.textScaleFactor,
        ),
      ),
      actions: actions,
    );

    final double appBarHeight = appBar is PreferredSizeWidget ? appBar.preferredSize.height : 0.0;

    final availableHeight = mediaQuery.size.height - appBarHeight - MediaQuery.of(context).padding.top;

    final bodyPage = SafeArea(

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Exibir Gráfico'),
                    Switch.adaptive(
                      activeColor: Theme.of(context).splashColor,
                      value: _showChart,
                      onChanged: (value) {
                        setState(() {
                          _showChart = value;
                        });
                      },
                    )
                  ],
                ),
              if(_showChart || !isLandscape)
                Container(
                  height: (availableHeight * 0.30).clamp(0.0, double.infinity),
                  child: Chart(_recentTransactions.toList()),
                ),
              if(!_showChart || !isLandscape)
                Container(
                  height: (availableHeight * (isLandscape ? 0.7 : 0.3))
                      .clamp(0.0, double.infinity),
                  child: TransactionList(_transactions, _removeTransaction),
                )
            ],
          ),
        ),
    );

    return Platform.isIOS ? CupertinoPageScaffold(child: bodyPage) : Scaffold(

      body: bodyPage,
      floatingActionButton: Platform.isIOS ? Container() : FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}




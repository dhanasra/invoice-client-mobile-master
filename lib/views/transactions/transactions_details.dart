import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';

class TransactionsDetails extends StatefulWidget {
  const TransactionsDetails({Key? key}) : super(key: key);

  @override
  _TransactionsDetailsState createState() => _TransactionsDetailsState();
}

class _TransactionsDetailsState extends State<TransactionsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTypes.appBarBack(
            onPressed: ()=>App().setBackNavigation(context),
            title: AppRoutes.CURRENT_PATH
        ),
        body: body()
    );
  }

  Widget body(){
    return Column(
      children: [
        DefaultInvoice()
      ],
    );
  }
}

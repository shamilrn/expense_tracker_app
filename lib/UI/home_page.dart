import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'exp_list_page.dart';
import 'exp_provider.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final expenseProvider = Provider.of<ExpProvider>(context);
    final totalExpenses = expenseProvider.expenses.fold(0.0, (sum, item) => sum + item.amount);


    return Scaffold(
     appBar: AppBar(
       foregroundColor: Colors.white,
       backgroundColor: Colors.teal,
       title: Text("Expense Tracker"),
       centerTitle: true,
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("Total Expense: \$${totalExpenses.toStringAsFixed(2)}",
           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
           ),
           SizedBox(height: 20,),
           ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>ExpListPage()
             ),
             );
           },
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.teal,
               foregroundColor: Colors.white,
             ),
               child: Text("View Expenses"),
           ),
         ],
       ),
     ),
   );
  }
}
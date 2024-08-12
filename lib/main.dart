import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_expense_tracker/Notifications/notification_services.dart';
import 'package:personal_expense_tracker/UI/exp_provider.dart';
import 'package:provider/provider.dart';

import 'Data/exp_local_data.dart';
import 'Data/exp_repository_imp.dart';
import 'UI/exp_list_page.dart';
import 'UI/home_page.dart';
import 'features/add_expense.dart';
import 'features/get_expenses.dart';
import 'features/remove_expense.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// depencey injection
  final getIt = GetIt.instance;

  //local notification
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final notificationServices = NotificationServices(flutterLocalNotificationsPlugin);
  await notificationServices.init();

  //data layer
  final expenseLocalData = ExpLocalDataImp();
  final expenseRepository = ExpRepositoryImp(expenseLocalData);

  //use case
  final getExpenses = GetExpenses(expenseRepository);
  final addExpense = AddExpense(expenseRepository);
  final removeExpense = RemoveExpense(expenseRepository);

  getIt.registerSingleton<ExpProvider>(
    ExpProvider(
        getExpenses: getExpenses,
        addExpense: addExpense,
        removeExpense: removeExpense
    ),
  );


  runApp(MyApp(notificationService: notificationServices));
}

class MyApp extends StatelessWidget {
  final NotificationServices notificationService;

  MyApp({required this.notificationService});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GetIt.instance<ExpProvider>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Tracker',
        theme: ThemeData(primarySwatch: Colors.blue,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            // hoverColor: Colors.red,
            // splashColor: Colors.white,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/task_provider.dart';
import 'package:todo_list/views/home_view.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
  return ChangeNotifierProvider(
    create: (context) => TaskProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    ),
  );
  
  }
}




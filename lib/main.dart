import 'package:flutter/material.dart';
import 'package:todo_list/views/home_view.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeView(),
  );
  
  }
}




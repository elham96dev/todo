
import 'package:flutter/material.dart';
import 'package:todo_list/widgets/header_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool checkBox = false;
  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      body: Column(
        children: [
          HeaderWidget(),
          Card(
            child: ListTile(
              title: Text(
                "Title",
                style: TextStyle(
                  fontFamily: "todo",
                  fontSize: 24,
                  color: Colors.green.shade800,
                  fontWeight: FontWeight.w400
                ),
              ),
              subtitle: Text(
                "Text...",
                  style: TextStyle(
                  fontFamily: "todo",
                  fontSize: 18,
                  color: Colors.green.shade800,
                ),
              ),
              leading: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.green.shade800,
                value: checkBox,
                onChanged: (value) {
                  setState(() {
                    checkBox = value ?? false;
                  });
                }
              ),
            ),
          )
        ],
      ),
    ),
  );
  
  }
}
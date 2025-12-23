
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/constants/color_constant.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/model/task_provider.dart';
import 'package:todo_list/widgets/header_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool checkBox = false;
  late final TextEditingController _titleController;
  late final TextEditingController _textController;

  @override
  void initState(){
    _titleController = TextEditingController();
    _textController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _titleController.dispose();
    _textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final watchProvider = context.watch<TaskProvider>();
    final provider = context.read<TaskProvider>();
  return SafeArea(
    child: Scaffold(
      backgroundColor: gray3,
      floatingActionButton: FloatingActionButton(
      onPressed:() async {
        final add = await showDialog(
        context: context, builder:(context) {
          return AlertDialog(
            title: Text(
              "Add task",
              style: TextStyle(
                fontSize: 22,
                fontFamily: "todo",
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    label: Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green.shade800,
                        fontFamily: "todo",
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green.shade500,
                      ),
                    ),
                  ),
                  cursorColor: Colors.green.shade800,
                  style: TextStyle(
                    color: Colors.green.shade700,
                  ),
                ),
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    label: Text(
                      "Text",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green.shade800,
                        fontFamily: "todo",
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green.shade500,
                      ),
                    ),
                  ),
                  cursorColor: Colors.green.shade800,
                  style: TextStyle(
                    color: Colors.green.shade700,
                  ),
                )
              ],
            ),
            actions: [
              TextButton(onPressed:() {
                Navigator.pop(context,true);
              }, child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.green.shade800,
                  fontFamily: "todo",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ))
            ],
          );
        },
      );
      if(add != null && add){
        //create task
        final task = Task(
          isDone: false,
          title: _titleController.text,
          text: _textController.text,
        );
        provider.create(task: task);
      }
        _titleController.clear();
        _textController.clear();
      },
      backgroundColor: Colors.green.shade800,
      shape: CircleBorder(),
      elevation: 5,
      child: Icon(
        Icons.add,
        size: 28,
        color: Colors.white,
        
      ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            HeaderWidget(),
            SizedBox(
              height: 380,
              child: ListView.builder(
                itemCount: watchProvider.tasks.length,
                itemBuilder:(context, index) {
                  // final tasks = watchProvider.tasks;
                  // final task = tasks[index];
                  final tasks = watchProvider.tasks[index];
                  return Card(
              elevation: 7,
              child: ListTile(
                title: Text(
                  tasks.title,
                  style: TextStyle(
                    fontFamily: "todo",
                    fontSize: 24,
                    color: Colors.green.shade800,
                    fontWeight: FontWeight.w400
                  ),
                ),
                subtitle: Text(
                  tasks.text,
                    style: TextStyle(
                    fontFamily: "todo",
                    fontSize: 18,
                    color: Colors.green.shade800,
                  ),
                ),
                leading: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.green.shade800,
                  value: tasks.isDone,
                  onChanged: (value) {
                    setState(() {
                      checkBox = value ?? false;
                    });
                  }
                ),
              ),
            );
          },
          ),
        ),
          
      ],
    ),
  ),
),
);
  
}
}
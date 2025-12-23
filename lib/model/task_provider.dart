
import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';

class TaskProvider extends ChangeNotifier{
  final List<Task> taskList = [
    Task(isDone: false, title: "Title", text: "text..."),
    Task(isDone: true, title: "Title", text: "text..."),
  ];
  List<Task> get tasks => taskList;

  void create ({required Task task}){
    taskList.add(task);
    notifyListeners();
  }
    
}


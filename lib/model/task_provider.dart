
import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';

class TaskProvider extends ChangeNotifier{
  final List<Task> taskList = [
    Task(isDone: false, title: "title1", text: "text1"),
    Task(isDone: true, title: "title2", text: "text2"),
  ];
  List<Task> get tasks => taskList;
}


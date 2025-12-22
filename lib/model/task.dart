
import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String title;
  final String text;
  bool isDone;


Task({
  required this.isDone,
  required this.title,
  required this.text,
  }) : id = Uuid().v4();
}
import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Buy groceries'),
    Task(name: 'Attend meeting'),
  ];

  List<Task> get tasks => _tasks;

  int get taskCount => _tasks.length;

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

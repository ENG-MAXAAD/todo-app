import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../models/task.dart';

class TaskData extends ChangeNotifier {
  final Box<Task> _taskBox = Hive.box<Task>('tasks');
  String _searchQuery = ""; // Holds the search query

  // Returns a filtered or all tasks
  List<Task> get tasks {
    if (_searchQuery.isEmpty) {
      return _taskBox.values.toList(); // Return all tasks if no search query
    }
    return _taskBox.values
        .where((task) =>
            task.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  // Total task count (filtered by search query)
  int get taskCount => tasks.length;

  // Update search query
  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners(); // Notify UI to refresh
  }

  // Add a new task
  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _taskBox.add(task); // Save task to Hive
    notifyListeners();
  }

  // Update task completion status
  void updateTask(Task task) {
    task.toggleDone(); // Toggle isDone property
    task.save(); // Save changes to Hive
    notifyListeners();
  }

  // Update task name
  void updateTaskName(Task task, String newName) {
    final taskKey = task.key; // Get the unique key of the task
    final updatedTask =
        Task(name: newName, isDone: task.isDone); // Create updated task
    _taskBox.put(taskKey, updatedTask); // Replace the old task
    notifyListeners();
  }

  // Delete a task
  void deleteTask(Task task) {
    task.delete(); // Remove the task from Hive
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/task_screen.dart';
import 'package:todo_app/services/task_service.dart';

import 'models/task.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register the TaskAdapter manually
  Hive.registerAdapter(TaskAdapter());

  // Open the Hive box
  await Hive.openBox<Task>('tasks');

  // Run the app
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: TasksScreen(),
      ),
    );
  }
}

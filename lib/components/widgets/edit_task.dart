import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/task.dart';
import '../../services/task_service.dart';

class EditTask extends StatelessWidget {
  final Task task;

  EditTask({required this.task});

  @override
  Widget build(BuildContext context) {
    String updatedTaskTitle = task.name;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Edit Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
            ),
            SizedBox(height: 20),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              // initialValue: task.name, // Pre-fill with current task name
              onChanged: (newText) {
                updatedTaskTitle = newText;
              },
              decoration: InputDecoration(
                hintText: 'Update task name...',
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              onPressed: () {
                if (updatedTaskTitle.isNotEmpty) {
                  Provider.of<TaskData>(context, listen: false).updateTaskName(
                      task, updatedTaskTitle); // Update task name
                  Navigator.pop(context); // Close the dialog
                }
              },
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/task_service.dart';
import 'edit_task.dart';
import 'tasks_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        if (taskData.taskCount == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.task_alt, size: 100, color: Colors.grey[300]),
                SizedBox(height: 20),
                Text(
                  'No tasks found!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Add a task to get started or adjust your search.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: taskData.taskCount, // Use filtered task count
          itemBuilder: (context, index) {
            final task = taskData.tasks[index]; // Use filtered tasks
            return TasksTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task); // Toggle task completion
              },
              longPressCallback: () {
                taskData.deleteTask(task); // Delete task on long press
              },
              editCallback: () {
                // Open Edit Task Dialog
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => EditTask(task: task),
                );
              },
            );
          },
        );
      },
    );
  }
}

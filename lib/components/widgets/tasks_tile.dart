import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function(bool?) checkboxCallback;
  final Function()? longPressCallback;
  final Function()? editCallback;

  TasksTile({
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
    this.longPressCallback,
    this.editCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: editCallback,
      onLongPress: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Delete Task"),
            content: Text("Are you sure you want to delete this task?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx); // Close dialog
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  if (longPressCallback != null) longPressCallback!();
                  Navigator.pop(ctx); // Close dialog
                },
                child: Text("Delete"),
              ),
            ],
          ),
        );
      },
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}

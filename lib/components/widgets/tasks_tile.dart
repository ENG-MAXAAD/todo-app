import 'package:art_sweetalert/art_sweetalert.dart';
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
      onTap: () {},
      onLongPress: () {
        // Directly use ArtSweetAlert.show
        ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            title: "Delete Task",
            type: ArtSweetAlertType.warning,
            text: "Are you sure you want to delete this task?",
            confirmButtonText: "Delete",
            confirmButtonColor: Colors.red,
            cancelButtonText: "Cancel",
            showCancelBtn: true,
            onConfirm: () {
              if (longPressCallback != null) longPressCallback!();
              Navigator.pop(context); // Close the dialog
            },
            onCancel: () {
              Navigator.pop(context); // Close the dialog
            },
          ),
        );
      },
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: SizedBox(
        width: 100, // Adjust the width to fit your design
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: editCallback,
              child: Image.asset(
                'assets/Images/edit.png',
              ),
            ),
            Checkbox(
              activeColor: Colors.lightBlueAccent,
              value: isChecked,
              onChanged: checkboxCallback,
            ),
          ],
        ),
      ),
    );
  }
}

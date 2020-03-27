import 'package:flutter/material.dart';


class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxIsDone;
  TaskTile({this.isChecked, this.taskTitle, this.checkboxIsDone});
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.black87,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      value: isChecked,
      onChanged: checkboxIsDone,
      activeColor: Colors.lightBlueAccent,
    );
  }
}



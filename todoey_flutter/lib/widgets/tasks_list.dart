import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/widgets/task_tile.dart';
import 'package:todoeyflutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];

            return GestureDetector(
              onLongPress: () {
                taskData.deleteTask(task);
              },
              child: TaskTile(
                taskTitle: task.taskName,
                isChecked: task.isDone,
                checkboxIsDone: (checkboxState) {
                  taskData.updateTask(task);
                },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

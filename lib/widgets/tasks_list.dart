import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Dismissible(
              key: Key(taskData.tasks[index].name),
              child: TaskTile(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkBoxCallback: (bool checkboxState) {
                  taskData.UpdateTask(taskData.tasks[index]);
                },
//              longPressCallback: () {
//                taskData.deleteTask(taskData.tasks[index]);
//              },
              ),
              onDismissed: (direction) {
                taskData.deleteTask(taskData.tasks[index]);
              });
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}

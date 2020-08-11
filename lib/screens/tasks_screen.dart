import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:todoey_flutter/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber[600],
        icon: Icon(
          Icons.add,
          size: 30,
        ),
        label: Text('Add task'),
        onPressed: () {
          showModalBottomSheet(
            elevation: 6.0,
            enableDrag: true,
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskScreen(
                (newTaskTitle) {
//                  setState(() {
//                    Provider.of<TaskData>(context).tasks.add(
//                          Task(name: newTaskTitle),
//                        );
//                  });
                  Navigator.pop(context);
                },
              ),
            )),
            //check  resources for explanation
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, bottom: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 40,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.amber[600],
                  radius: 30,
                ),
                SizedBox(height: 15),
                Text(
                  'RemindME',
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 40,
                      color: Colors.white),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} tasks left',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.only(
          top: 20.0,
          left: 35.0,
          right: 35.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 35.0,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 5.0,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 5.0,
                  ),
                ),
              ),
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newTask) {
               newTaskTitle = newTask;
              },
            ),
            SizedBox(
              height: 25.0,
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal),
              ),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTasks(newTaskTitle);
                Navigator.pop(context);
                },
              padding: EdgeInsets.all(12.0),
            ),
          ],
        ),
      ),
    );
  }
}

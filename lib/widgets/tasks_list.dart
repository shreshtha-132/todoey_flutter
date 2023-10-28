import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

import '../models/task.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: Provider.of<TaskData>(context).tasks![index].isDone,
          TaskTitle: Provider.of<TaskData>(context).tasks![index].name,
          checkboxCallback: (checkboxState) {
            Provider.of<TaskData>(context)
                .updateTask(Provider.of<TaskData>(context).tasks![index]);
          },
          longPressCallback: () {
            Provider.of<TaskData>(context)
                .deleteTask(Provider.of<TaskData>(context).tasks![index]);
          },
        );
      },
      itemCount: Provider.of<TaskData>(context).tasks?.length,
    );
  }
}

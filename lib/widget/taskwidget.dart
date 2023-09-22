import 'package:bloc_practice_two/bloc/bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/task.dart';

// ignore: must_be_immutable
class TaskWidgetPage extends StatefulWidget {
  TaskWidgetPage({super.key, required this.taskitem});
  Task taskitem;

  @override
  State<TaskWidgetPage> createState() => _TaskWidgetPageState();
}

class _TaskWidgetPageState extends State<TaskWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        
      },
      leading: Text(widget.taskitem.title),
      onLongPress: () {
       context.read<TaskBloc>().add(DeleteTaskEvent(task: widget.taskitem));  
      },
      trailing: Checkbox(
          value: widget.taskitem.isdone,
          onChanged: (value) {
              context.read<TaskBloc>().add(UpdateTaskEvent(task: widget.taskitem));
          }),
    );
  }
}

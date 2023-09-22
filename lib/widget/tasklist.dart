import 'package:bloc_practice_two/widget/taskwidget.dart';
import 'package:flutter/cupertino.dart';

import '../model/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasklist,
  });

  final List<Task> tasklist;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        primary: false,
        shrinkWrap: true,
        //physics: ,
        itemBuilder: (context, index) {
          return TaskWidgetPage(taskitem: tasklist[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: tasklist.length);
  }
}

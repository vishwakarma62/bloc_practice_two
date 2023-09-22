import 'package:bloc_practice_two/screen/taskscreentwo.dart';

import 'package:flutter/material.dart';



import '../bloc/exportbloc.dart';
import '../model/task.dart';
import '../widget/tasklist.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
   
    super.initState();
    
  }
  void _addtask(BuildContext context) {
    showModalBottomSheet(
        context: (context),
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddTaskScreen(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> tasklist = state.alltask;
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.teal,
            actions: [
              IconButton(
                  onPressed: () {
                  
                    
                    _addtask(context);
                  },
                  icon: const Icon(Icons.add))
            ],
            title: Text(
              "Task App",
              style: TextStyle(color: Colors.white.withOpacity(0.8)),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addtask(context);
            },
            tooltip: "Add Item",
            backgroundColor: Colors.lightBlueAccent,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: Column(
            children: [
              TaskList(tasklist: tasklist),
            ],
          ),
        );
      },
    );
  }
}

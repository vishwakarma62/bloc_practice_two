import 'package:bloc_practice_two/bloc/bloc/task_bloc.dart';
import 'package:bloc_practice_two/model/task.dart';
import 'package:bloc_practice_two/screen/taskscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';


import 'bloc/exportbloc.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();

  // Get the directory for storing hydrated data
  final appDocumentDir = await getApplicationDocumentsDirectory();

  // Initialize storage for hydrated_bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: appDocumentDir,
  );
  // ignore: deprecated_member_use
  HydratedBlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskBloc()..add(AddTaskEvent(task: Task(title: "Task1"))),
      child: MaterialApp(
        title: 'Flutter Demo', 
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TaskScreen(),
      ),
    );
  }
}

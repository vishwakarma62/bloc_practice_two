import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../model/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTaskEvent>(addTaskEvent);
    on<UpdateTaskEvent>(updateTaskEvent);
    on<DeleteTaskEvent>(deleteTaskEvent);
  }

  FutureOr<void> addTaskEvent(AddTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;

    emit(TaskState(alltask: List.from(state.alltask)..add(event.task)));
  }

  FutureOr<void> updateTaskEvent(
      UpdateTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    // var task = event.task;
    final int index = state.alltask.indexOf(event.task);
    List<Task> alltask = List.from(state.alltask)..remove(event.task);

    event.task.isdone == false
        ? alltask.insert(index, event.task.copyWith(isdone: true))
        : alltask.insert(index, event.task.copyWith(isdone: false));

    emit(TaskState(alltask: alltask));
  }

  FutureOr<void> deleteTaskEvent(
      DeleteTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(alltask: List.from(state.alltask)..remove(event.task)));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}

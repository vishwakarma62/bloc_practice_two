part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> alltask;
  const TaskState({
    this.alltask = const <Task>[],
  });

  @override
  List<Object> get props => [alltask];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'alltask': alltask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      alltask: List<Task>.from(
        (map['alltask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskState.fromJson(String source) =>
      TaskState.fromMap(json.decode(source) as Map<String, dynamic>);
}

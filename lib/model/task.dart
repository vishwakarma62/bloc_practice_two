import 'package:equatable/equatable.dart';


// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  bool? isdone;
  bool? isdeleted;

  Task({required this.title, this.isdeleted, this.isdone}) {
    isdone = isdone ?? false;
    isdeleted = isdeleted ?? false;
  }
  Task copyWith({
    String? title,  
    bool? isdone,
    bool? isdeleted,
  }) {
    return Task(
        title: title ?? this.title,
        isdeleted: isdeleted ?? this.isdeleted,
        isdone: isdone ?? this.isdone);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isdone': isdone,
      'isdeleted': isdeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        title: map['title'],
        isdeleted: map['isdeleted'],
        isdone: map['isdone']);
  }

  @override
 
  List<Object?> get props => [title, isdone, isdeleted];
}
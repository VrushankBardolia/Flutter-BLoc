part of 'todo_bloc.dart';

@immutable
abstract class ToDoEvent extends Equatable{
  const ToDoEvent();
}

class Add extends ToDoEvent{

  final String task;
  const Add({ required this.task});
  @override
  List<Object?> get props => [task];
}

class Remove extends ToDoEvent{

  final Object index;
  const Remove({ required this.index});
  @override
  List<Object?> get props => [index];
}
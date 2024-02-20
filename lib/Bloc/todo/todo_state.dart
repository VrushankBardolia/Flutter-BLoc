part of 'todo_bloc.dart';

@immutable
class ToDoState extends Equatable{

  final List<String> todo;
  const ToDoState({
    this.todo= const []
  });

  ToDoState copyWith({List<String>? todo}){
    return ToDoState(
      todo: todo ?? this.todo
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [todo];

}

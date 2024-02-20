import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {

  final List<String> todo=[];
  ToDoBloc() : super(const ToDoState()){
    on<Add>(_add);
    on<Remove>(_remove);
  }

  void _add(Add event, Emitter<ToDoState> emit){
    todo.add(event.task);
    emit(state.copyWith(todo: List.from(todo)));
  }
  void _remove(Remove event, Emitter<ToDoState> emit){
    todo.remove(event.index);
    emit(state.copyWith(todo: List.from(todo)));
  }

}

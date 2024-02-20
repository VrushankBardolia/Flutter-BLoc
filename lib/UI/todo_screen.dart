import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/todo/todo_bloc.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<ToDoBloc, ToDoState>(
          builder: (context, state) {
            if(state.todo.isEmpty){
              return const Center(child: Text('No ToDos'));
            }
            else if(state.todo.isNotEmpty){
              return ListView.builder(
                  itemCount: state.todo.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.todo[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<ToDoBloc>().add(Remove(index:state.todo[index]));
                        },
                      ),
                    );
                  }
              );
            }
            else{
              return const SizedBox();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for(int i = 0 ; i < 10 ; i++ ) {
            context.read<ToDoBloc>().add(Add(task: 'Task $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

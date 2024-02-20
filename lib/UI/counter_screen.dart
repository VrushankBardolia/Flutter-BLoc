import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_examples/Bloc/counter/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc,CounterState>(
              builder: (context,state){
                return Text(state.counter.toString(),style: const TextStyle(fontSize: 40));
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                    onPressed: ()=> context.read<CounterBloc>().add(IncrementCounter()),
                    child: const Text('Increment')
                ),
                const SizedBox(width: 20),
                FilledButton(
                    onPressed: ()=> context.read<CounterBloc>().add(DecrementCounter()),
                    child: const Text('Decrement')
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

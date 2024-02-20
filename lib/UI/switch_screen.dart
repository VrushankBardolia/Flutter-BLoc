import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_examples/Bloc/switch/switch_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch & Slider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SwitchBloc,SwitchState>(
              buildWhen: (previous,current)=>previous.isSwitch!=current.isSwitch,
                builder: (context,state){
                print('noti');
                  return SwitchListTile(
                    value: state.isSwitch,
                    onChanged: (value)=>context.read<SwitchBloc>().add(EnableOrDisableNotification()),
                    title: const Text('Notification'),
                  );
                }
            ),
            const SizedBox(height: 20),
            BlocBuilder<SwitchBloc,SwitchState>(
              builder: (context,state){
                return Container(
                  height: 300,
                  color: Colors.blue.withOpacity(state.slider),
                );
              }
            ),
            const SizedBox(height: 20),
            BlocBuilder<SwitchBloc,SwitchState>(
              buildWhen: (previous,current)=>previous.slider!=current.slider,
              builder: (context,state){
                print('slider');
                return Slider(
                  value: state.slider,
                  onChanged: (value)=>context.read<SwitchBloc>().add(SliderEvent(slider: value)),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

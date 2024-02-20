import 'package:flutter/material.dart';

import 'UI/favourite_screen.dart';
import 'UI/post_screen.dart';
import 'UI/counter_screen.dart';
import 'UI/image_picker_screen.dart';
import 'UI/switch_screen.dart';
import 'UI/todo_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('Counter Example'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CounterScreen()));
              },
            ),
            ListTile(
              title: const Text('Switch & Slider Example'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SwitchScreen()));
              },
            ),
            ListTile(
              title: const Text('Image Picker Example'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ImagePickerScreen()));
              },
            ),
            ListTile(
              title: const Text('ToDo Example'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ToDoScreen()));
              },
            ),
            ListTile(
              title: const Text('Favourite Example'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const FavouriteScreen()));
              },
            ),
            ListTile(
              title: const Text('API Posts Example'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const PostScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

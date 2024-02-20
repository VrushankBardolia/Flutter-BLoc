import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_examples/Bloc/image_picker/image_picker_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc,ImagePickerState>(
          builder: (context, state) {
            if(state.file==null){
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton.filledTonal(
                    onPressed: (){
                      context.read<ImagePickerBloc>().add(Camera());
                    },
                    icon: const Icon(Icons.camera_alt),
                  ),
                  IconButton.filledTonal(
                    onPressed: (){
                      context.read<ImagePickerBloc>().add(Gallery());
                    },
                    icon: const Icon(Icons.photo),
                  ),
                ],
              );
            } else{
              return Image.file(File(state.file!.path.toString()));
            }
          },
        ),
      )
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../utils/image_picker_utils.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {

  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<Camera>(_camera);
    on<Gallery>(_gallery);
  }

  void _camera(ImagePickerEvent event,Emitter<ImagePickerState> emit)async{
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _gallery(ImagePickerEvent event,Emitter<ImagePickerState> emit)async{
    XFile? file = await imagePickerUtils.fromGallery();
    emit(state.copyWith(file: file));
  }
}

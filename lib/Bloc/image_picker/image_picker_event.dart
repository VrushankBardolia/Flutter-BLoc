part of 'image_picker_bloc.dart';

@immutable
abstract class ImagePickerEvent extends Equatable{
  const ImagePickerEvent();

  @override
  List<Object> get props=>[];
}

class Camera extends ImagePickerEvent{}

class Gallery extends ImagePickerEvent{}
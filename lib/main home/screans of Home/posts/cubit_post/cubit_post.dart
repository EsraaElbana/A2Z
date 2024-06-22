import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageState {
  final List<File> selectedImages;
  ImageState({required this.selectedImages});
}

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageState(selectedImages: []));

  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      final files = pickedFiles.map((file) => File(file.path)).toList();
      emit(ImageState(selectedImages: files));
    }
  }
}

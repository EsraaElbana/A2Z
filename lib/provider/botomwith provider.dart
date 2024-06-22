import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
  Color selectedColor = Colors.indigo.shade700;


  void updateColorAndIcon(Color newColor, int newIconIndex) {
    selectedColor = newColor;
    _selectedIndex = newIconIndex;

    notifyListeners();
  }
  List<XFile> _selectedImages = []; // Hold selected images

  List<XFile> get selectedImages => _selectedImages;

  Future<void> pickImages() async {
    final pickedImages = await ImagePicker().pickMultiImage(
      imageQuality: 70, // Set image quality as required
    );

    if (pickedImages != null) {
      _selectedImages = pickedImages;
      notifyListeners();
    }
  }
}

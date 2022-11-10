import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class imageProvider with ChangeNotifier {
  List<Map<String, dynamic>> _images = [];
  List<Map<String, dynamic>> get images => _images;
  void add(File imageFile, String imageDate) {
    _images.add({
      'imagePath': imageFile,
      'Date': imageDate,
    });
    print(images);
    notifyListeners();
  }
}

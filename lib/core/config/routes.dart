import 'package:flutter/material.dart';
import 'package:myapp/features/home/presentation/pages/home.dart';
import 'package:myapp/features/image_generate/presentation/pages/generate_image.dart';

class Routes {
  static const String home = '/';
  static const String generateImage = '/generate_image';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/home': (context) => HomeScreen(),
      '/generate_image': (context) => const GenerateImage(),
    };
  }
}

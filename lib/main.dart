import 'dart:io';
import 'package:custom_camera_app/datamodel/image_provider.dart';
import 'package:custom_camera_app/screen/cameraScreen.dart';
import 'package:custom_camera_app/screen/gallery_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'screen/cameraScreen.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    print(cameras[0]);
  } on CameraException catch (e) {
    print(' Error in fetchin the cameras. $e');
  }
  runApp(MyApp());
}

List<CameraDescription> cameras = [];

class MyApp extends StatelessWidget {
  File? image;
  MyApp({this.image, super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => imageProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue, backgroundColor: Colors.black),
        // home: GalleryScreen(image: image!),
        home: CameraScreen(),
      ),
    );
  }
}

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:custom_camera_app/screen/cameraScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path_provider/path_provider.dart';

class GalleryScreen extends StatefulWidget {
  File? image;
  GalleryScreen({this.image, super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReCam'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => CameraScreen()));
                print(widget.image!.path);
              },
              icon: Icon(Icons.camera_alt_outlined))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Album',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          SingleChildScrollView(
            child: widget.image == null
                ? Container()
                : Container(
                    width: 100,
                    height: 100,
                    child: Image.file(
                      File(widget.image!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

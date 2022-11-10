import 'dart:io';

import 'package:custom_camera_app/datamodel/image_provider.dart';
import 'package:custom_camera_app/main.dart';
import 'package:custom_camera_app/screen/gallery_screen.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class PreviewScreen extends StatefulWidget {
  final File? imageFile;
  const PreviewScreen(this.imageFile, {super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    File image;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.file(File(widget.imageFile!.path), fit: BoxFit.cover),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 60,
                color: Color.fromARGB(255, 92, 92, 92),
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () async {
                          int currentUnix =
                              DateTime.now().millisecondsSinceEpoch;
                          final directory = await getExternalStorageDirectory();
                          String fileFormat =
                              widget.imageFile!.path.split('.').last;

                          image = await widget.imageFile!.copy(
                            '${directory!.path}/$currentUnix.$fileFormat',
                          );
                          // print(directory![0].path);
                          await ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Photo Saved'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Provider.of<imageProvider>(context, listen: false)
                              .add(image, DateTime.now().toIso8601String());

                          print('${directory}/$currentUnix.$fileFormat');
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => GalleryScreen(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.check,
                          color: Colors.black,
                          size: 40,
                        )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

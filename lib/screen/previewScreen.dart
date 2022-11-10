import 'dart:io';

import 'package:custom_camera_app/main.dart';
import 'package:custom_camera_app/screen/gallery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path_provider/path_provider.dart';

class PreviewScreen extends StatelessWidget {
  final File? imageFile;
  const PreviewScreen(this.imageFile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.file(File(imageFile!.path), fit: BoxFit.cover),
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
                          // print(directory![0].path);
                          String fileFormat = imageFile!.path.split('.').last;
                          await imageFile!.copy(
                            '${directory!.path}/$currentUnix.$fileFormat',
                          );
                          await ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Photo Saved'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          // print('${directory}/$currentUnix.$fileFormat');
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                GalleryScreen(image: imageFile),
                          ));
                        },
                        icon: Icon(
                          Icons.check,
                          color: Colors.white,
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

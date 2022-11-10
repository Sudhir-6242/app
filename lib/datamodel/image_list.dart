import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../datamodel/image_provider.dart';
import 'package:intl/intl.dart';

class ImageList extends StatefulWidget {
  const ImageList({super.key});

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<imageProvider>(
      builder: (context, data, ch) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: double.infinity,
          child: ListView.builder(
            itemCount: data.images.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 150,
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        DateFormat.yMMMd().format(
                            DateTime.now().subtract(Duration(days: index))),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        reverse: true,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: data.images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                              ),
                            ),
                            height: double.infinity,
                            child: Image.file(
                              data.images[index]['imagePath'],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

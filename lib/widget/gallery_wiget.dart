import 'package:custom_camera_app/screen/cameraScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

// import '../camera_page.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 12.0, bottom: 4),
                        child: Text(
                          'Album',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 500,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            height: 150,
                            color: Colors.white,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    'Today',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 4,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        width: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                          ),
                                        ),
                                        height: double.infinity,
                                        child: Image.asset(
                                          'assets/images/flower.jpg',
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
                    ),
                  ]),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 10,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.black,
          selectedFontSize: 13,
          unselectedFontSize: 13,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: InkWell(
                child: const Icon(
                  CupertinoIcons.folder,
                  color: Colors.black,
                  size: 28,
                ),
                onTap: () {
                  print('Clicked on Album');
                },
              ),
              label: 'Album',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                child: const Icon(
                  CupertinoIcons.camera,
                  color: Colors.black,
                  size: 28,
                ),
                onTap: () async {
                  await availableCameras().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CameraScreen())));
                },
              ),
              label: 'Camera',
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> appBarActions(BuildContext context) {
  return [
    PopupMenuButton<String>(
      constraints: const BoxConstraints(maxHeight: 100, maxWidth: 120),
      offset: const Offset(0, 45),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      itemBuilder: (_) {
        return const [
          PopupMenuItem<String>(value: '1', child: Text("MyAccount")),
          PopupMenuDivider(
            height: 1,
          ),
          PopupMenuItem<String>(
              value: "4",
              child: Text(
                "LogOut",
                style: TextStyle(color: Colors.red),
              )),
        ];
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          children: const [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.person,
                size: 25,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      onSelected: (i) {
        if (i == "1") {
          displayBar(context, i);
        } else if (i == "2") {
          displayBar(context, i);
        } else if (i == "3") {
          displayBar(context, i);
        } else if (i == "4") {
          displayBar(context, i);
        } else {}
      },
      onCanceled: () => displayBar(context, "Cancelled", cancel: true),
    ),
  ];
}

dynamic displayBar(BuildContext context, String text, {bool cancel = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: !cancel ? Text("Click Item $text") : Text(text)));
}

DateTime findFirstDateOfTheWeek(DateTime dateTime) {
  return dateTime.subtract(Duration(days: dateTime.weekday - 1));
}

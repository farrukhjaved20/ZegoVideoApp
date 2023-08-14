import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/Containers/themedesign.dart';

import 'Videosccreen/Videocallpage.dart';
import 'audioscreen/audiocalll.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(80),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.1),
                const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 50),
                  title: Center(
                      child: Text(
                    'Calling App Using Zego Cloud',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
                SizedBox(height: height * 0.08)
              ],
            ),
          ),
          Container(
            color: Colors.blue.shade900,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200))),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 1,
                mainAxisSpacing: 20,
                children: [
                  ItemDashboard(
                    background: Colors.deepOrange,
                    iconData: CupertinoIcons.play_rectangle,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VideoCalling()));
                    },
                    title: 'Video Call',
                  ),
                  ItemDashboard(
                    background: const Color.fromARGB(255, 2, 114, 88),
                    iconData: CupertinoIcons.phone_arrow_right,
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AudioCallingScreen()));
                    },
                    title: 'Audio Call',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

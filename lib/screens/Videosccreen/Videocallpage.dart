// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:video_app/model/constants.dart';
import 'package:video_app/screens/Videosccreen/JoinGroupcall.dart';
import 'package:video_app/screens/Videosccreen/LiveScreen.dart';
import 'package:video_app/utils/utils.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCalling extends StatefulWidget {
  const VideoCalling({super.key});

  @override
  State<VideoCalling> createState() => _VideoCallingState();
}

class _VideoCallingState extends State<VideoCalling> {
  final callingId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(padding: EdgeInsets.zero, children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(80),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: height * 0.23),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 40),
                    title: const Center(
                        child: Text(
                      'Video Section Using Zego Cloud',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                    leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04)
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
                )),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: callingId,
                  decoration: const InputDecoration(
                      hintText: 'Enter Caller Id',
                      border: OutlineInputBorder())),
            ),
            SizedBox(height: height * 0.04),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleCallPage(
                          callingId: callingId.text.toString(),
                        ),
                      ));
                },
                child: const Text(
                  'Single Video Call',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            SizedBox(height: height * 0.02),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroupCallScreen()));
                },
                child: const Text(
                  'Join Video Call',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            SizedBox(height: height * 0.02),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LiveCallPage(
                                callID: callingId.text.toString(),
                              )));
                },
                child: const Text(
                  'Screen Share',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ]),
    );
  }
}

class SingleCallPage extends StatelessWidget {
  final String callingId;

  const SingleCallPage({super.key, required this.callingId});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ZegoUIKitPrebuiltCall(
      appID: Utils.appId,
      appSign: Utils.appSignin,
      callID: callingId,
      userID: localUserID,
      userName: 'user_$localUserID',
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..avatarBuilder = (BuildContext context, Size size, ZegoUIKitUser? user,
            Map extraInfo) {
          return user != null
              ? Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThsyVVdxkz5zyuE-yRKpdwtre_R234HkS2gQ&usqp=CAU'),
                    ),
                  ),
                )
              : const SizedBox();
        }
        ..hangUpConfirmDialogInfo = ZegoHangUpConfirmDialogInfo(
          title: "Hangup confirm",
          message: "Do you want to hangup?",
          cancelButtonName: "Cancel",
          confirmButtonName: "Confirm",
        ),
    ));
  }
}

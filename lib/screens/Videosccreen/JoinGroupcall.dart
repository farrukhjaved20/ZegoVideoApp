import 'package:flutter/material.dart';

import 'package:video_app/utils/utils.dart';

import 'dart:math' as math;

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../model/constants.dart';

final String userId = math.Random().nextInt(10000).toString();

class GroupCallScreen extends StatelessWidget {
  GroupCallScreen({super.key});

  final callingIdd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListView(padding: EdgeInsets.zero, children: [
      Column(children: [
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
                  'Group Call Using Zego Cloud',
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
              controller: callingIdd,
              decoration: const InputDecoration(
                  hintText: 'Enter Group Caller Id',
                  border: OutlineInputBorder())),
        ),
        SizedBox(height: height * 0.01),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GroupCallPage(callingId: callingIdd.text.toString());
              }));
            },
            child: const Text(
              'Join Video Call',
              style: TextStyle(
                color: Colors.white,
              ),
            )),
      ])
    ]));
  }
}

class GroupCallPage extends StatelessWidget {
  final String callingId;

  const GroupCallPage({super.key, required this.callingId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ZegoUIKitPrebuiltCall(
            appID: Utils.appId,
            appSign: Utils.appSignin,
            callID: callingId,
            userID: localUserID,
            userName: 'user_$localUserID',
            config: ZegoUIKitPrebuiltCallConfig.groupVideoCall()

            // ..onOnlySelfInRoom = (context) {
            //   Navigator.pop(context);
            // },
            ));
  }
}

import 'package:flutter/material.dart';
import 'package:video_app/model/constants.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../utils/utils.dart';

class LiveCallPage extends StatefulWidget {
  const LiveCallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  State<LiveCallPage> createState() => _LiveCallPageState();
}

class _LiveCallPageState extends State<LiveCallPage> {
  // this indicates whether the current state is full screen.
  bool isFullscreen = true;
  // use this to control whether to call the method to enable full-screen mode.
  ZegoUIKitPrebuiltCallController controller =
      ZegoUIKitPrebuiltCallController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
          appID: Utils.appId,
          appSign: Utils.appSignin,
          userID: localUserID,
          userName: 'user_$localUserID',
          callID: widget.callID,
          config: ZegoUIKitPrebuiltCallConfig.groupVideoCall()
            ..layout = ZegoLayout.gallery(
                showScreenSharingFullscreenModeToggleButtonRules:
                    ZegoShowFullscreenModeToggleButtonRules.alwaysShow,
                showNewScreenSharingViewInFullscreenMode:
                    false) // Set the layout to gallery mode. and configure the [showNewScreenSharingViewInFullscreenMode] and [showScreenSharingFullscreenModeToggleButtonRules].
            ..bottomMenuBarConfig = ZegoBottomMenuBarConfig(buttons: [
              ZegoMenuBarButtonName.toggleCameraButton,
              ZegoMenuBarButtonName.toggleMicrophoneButton,
              ZegoMenuBarButtonName.hangUpButton,
              ZegoMenuBarButtonName.toggleScreenSharingButton
            ]) // Add a screen sharing toggle button.
          ),
    );
  }
}

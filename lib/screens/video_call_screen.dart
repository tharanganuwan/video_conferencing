import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone_tutorial/resources/auth_methods.dart';
import 'package:zoom_clone_tutorial/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone_tutorial/utils/colors.dart';
import 'package:zoom_clone_tutorial/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(
      text: _authMethods.user.displayName,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideInUp(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text(
            'Join a Meeting',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: TextField(
                  controller: meetingIdController,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    hintText: 'Room ID',
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                child: TextField(
                  controller: nameController,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    hintText: 'Name',
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: _joinMeeting,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    'Join',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MeetingOption(
                text: 'Mute Audio',
                isMute: isAudioMuted,
                onChange: onAudioMuted,
              ),
              MeetingOption(
                text: 'Turn Off My Video',
                isMute: isVideoMuted,
                onChange: onVideoMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}

import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone_tutorial/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone_tutorial/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HomeMeetingButton(
                    onPressed: createNewMeeting,
                    text: 'New Meeting',
                    icon: Icons.videocam,
                    color: Color.fromARGB(255, 181, 14, 223),
                  ),
                  HomeMeetingButton(
                    onPressed: () => joinMeeting(context),
                    text: 'Join Meeting',
                    icon: Icons.add_box_rounded,
                    color: Color.fromARGB(255, 252, 4, 157),
                  ),
                  HomeMeetingButton(
                    onPressed: () {},
                    text: 'Schedule',
                    icon: Icons.calendar_today,
                    color: Color.fromARGB(255, 243, 247, 7),
                  ),
                  HomeMeetingButton(
                    onPressed: () {},
                    text: 'Share Screen',
                    icon: Icons.arrow_upward_rounded,
                    color: Color.fromARGB(255, 0, 255, 136),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 38.0),
                child: Image.asset('assets/images/coverr.png'),
              ),
              const Expanded(
                child: Center(

                    //  Text(
                    //   'Create/Join Meetings with just a click!',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 18,
                    //       color: Color.fromARGB(255, 100, 100, 100)),
                    // ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

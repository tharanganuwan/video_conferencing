import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:video_conferencing/screens/login_screen.dart';
import 'package:video_conferencing/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        MaterialPageRoute(builder: (context) => const LoginScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Bounce(
              child: Container(
                width: size.width,
                height: 100,
                child: Image.asset(
                  Constants.imageAssets(
                    'image.jpg',
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

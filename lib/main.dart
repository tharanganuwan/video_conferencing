import 'package:flutter/material.dart';
import 'package:video_conferencing/screens/home_screen.dart';
import 'package:video_conferencing/screens/login_screen.dart';
import 'package:video_conferencing/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const LoginScreen(),
    );
  }
}

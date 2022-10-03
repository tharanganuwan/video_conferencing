import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom_clone_tutorial/resources/auth_methods.dart';
import 'package:zoom_clone_tutorial/utils/colors.dart';
import 'package:zoom_clone_tutorial/widgets/custom_button.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              ClipOval(
                  child: Image.network(
                      FirebaseAuth.instance.currentUser!.photoURL.toString(),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover)),
              SizedBox(
                height: 20,
              ),
              Text(
                'WELCOME',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.06),
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  width: size.width,
                  height: 40,
                  child: Text(
                    FirebaseAuth.instance.currentUser!.displayName.toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.06),
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  width: size.width,
                  height: 40,
                  child: Text(
                    FirebaseAuth.instance.currentUser!.email.toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Log Out',
                  onPressed: () => AuthMethods().signOut(context)),
            ],
          ),
        ),
      ),
    );
  }
}

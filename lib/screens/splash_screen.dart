import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:multi_role_base_app/screens/admin_screen.dart';
import 'package:multi_role_base_app/screens/home_screen.dart';
import 'package:multi_role_base_app/screens/student_screen.dart';
import 'package:multi_role_base_app/screens/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if (isLogin) {
      if (userType == 'student') {
        // user was login as student
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const StudentScreen()));
        });
      }
      // user was login as teacher
      else if (userType == 'teacher') {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const TeacherScreen()));
        });
      }
      // user was login as admin
      else if (userType == 'admin') {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const AdminScreen()));
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        });
      }
    }
    //user is not logged in
    else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Multi Role Flutter App'),
      ),
      body: const Image(
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
          image: AssetImage('assets/logo.jpeg')),
    );
  }
}

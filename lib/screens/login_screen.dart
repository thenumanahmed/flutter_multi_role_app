import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'teacher_screen.dart';
import 'admin_screen.dart';
import 'home_screen.dart';
import 'student_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final ageController = TextEditingController();
  final typeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              //text field for email
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 20),

              //text field for password
              TextFormField(
                controller: passController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 20),

              //text field for age
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Age',
                ),
              ),
              const SizedBox(height: 20),

              //text field for userType
              TextFormField(
                controller: typeController,
                decoration: const InputDecoration(
                  hintText: 'userType(admin/teacher/student)',
                ),
              ),

              const SizedBox(height: 40),
              //Login button
              InkWell(
                onTap: () async {
                  //getting the shared preference instance for the app
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  String userType = typeController.text.toString();

                  //storing the data
                  sp.setString('email', emailController.text.toString());
                  sp.setString('age', ageController.text.toString());
                  sp.setString('userType', userType);
                  sp.setBool('isLogin', true);

                  //navigating through the screen
                  if (userType == 'admin') {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => AdminScreen()));
                  } else if (userType == 'teacher') {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TeacherScreen()));
                  } else if (userType == 'student') {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentScreen()));
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.green),
                  child: const Center(
                    child: Text('Login'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

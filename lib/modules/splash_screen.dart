import 'package:flutter/material.dart';
import 'package:nonpms_scanner_project/modules/login.dart';
import 'package:nonpms_scanner_project/utils/app_icons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the login page after 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set your preferred background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset(
                                AppIcons.logoIcon,
                                height: 50,
                                width: 35,
                              ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(), 
            const SizedBox(height: 20),
            const Text(
              'Welcome to Non-PMS Project',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

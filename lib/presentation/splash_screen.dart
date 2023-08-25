import 'package:flutter/material.dart';
import 'package:project_edspert_learning_course/presentation/login_page_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      ),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A7FD5),
      body: Center(
        child: Image.asset(
          'assets/image/logo_splashscreen.png',
          width: 159,
          height: 30,
        ),
      ),
    );
  }
}

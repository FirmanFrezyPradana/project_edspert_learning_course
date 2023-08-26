import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_edspert_learning_course/presentation/router/routers.dart';
import 'package:project_edspert_learning_course/presentation/screen/home/home_page_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _HomepageState();
}

class _HomepageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          children: [
            Container(
              margin: EdgeInsets.only(top: 49.0),
              width: 212,
              height: 30,
              child: Text(
                'lOGIN',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 360,
              height: 255,
              child: Image.asset(
                'assets/image/Analysis _Isometric.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Selamat Datang',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Selamat Datang di Aplikasi Widya Edu \n Aplikasi Latihan dan Konsultasi Soal',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6A7483),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: 269,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Color(0xff01B1AF),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.HomePage);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/logo/icons8-google-48.png',
                      width: 26,
                      height: 26,
                    ),
                    Text(
                      'Masuk dengan Google',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 269,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Color(0xff1A1F26),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                color: Color(0xFF1A1F26),
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/logo/apple-logo.png',
                      width: 26,
                      height: 26,
                    ),
                    Text(
                      'Masuk dengan Apple ID',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

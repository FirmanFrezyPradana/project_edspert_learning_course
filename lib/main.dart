import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_edspert_learning_course/presentation/router/pages.dart';
import 'package:project_edspert_learning_course/presentation/router/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: pages.getAllPages,
      initialRoute: Routes.SplashScreen,
    );
  }
}

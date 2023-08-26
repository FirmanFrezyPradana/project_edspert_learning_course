import 'package:get/route_manager.dart';
import 'package:project_edspert_learning_course/presentation/login_page_screen.dart';
import 'package:project_edspert_learning_course/presentation/router/routers.dart';
import 'package:project_edspert_learning_course/presentation/screen/home/home_binding.dart';
import 'package:project_edspert_learning_course/presentation/screen/home/home_page_screen.dart';
import 'package:project_edspert_learning_course/presentation/splash_screen.dart';

class pages {
  static final getAllPages = [
    GetPage(
      name: Routes.SplashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.LoginPage,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.HomePage,
      page: () => HomePage(),
      binding: HomeBidings(),
    )
  ];
}

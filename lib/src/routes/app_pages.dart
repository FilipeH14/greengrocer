import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/views/sign_in_screen.dart';
import 'package:greengrocer/src/pages/auth/views/sign_up_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:greengrocer/src/pages/splash/splash_screen.dart';
import 'package:greengrocer/src/routes/page_routes.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PageRoutes.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: PageRoutes.signInRoute,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: PageRoutes.signUpRoute,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: PageRoutes.baseScreenRoute,
      page: () => const BaseScreen(),
    ),
  ];
}

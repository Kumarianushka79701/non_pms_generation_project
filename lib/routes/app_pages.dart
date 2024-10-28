

// import 'package:flutter/material.dart';
// import 'package:nonpms_scanner_project/routes/app_routes.dart';

// import 'app_routes.dart';

// class AppPages {
//   static String? _lastRoute = "/";
//   static Route<dynamic> generateRoutes(RouteSettings setting) {
//     print("My Route is $_lastRoute");
//     _lastRoute = setting.name;

//     switch (setting.name) {
    
//       case Routes.LOGIN_MPIN:
//         final arguments = setting.arguments as Map<String, dynamic>;
       
//       case Routes.SUPERAPP_SPLASH:
//         return PageTransition(
//           settings: setting,
//           child: const SuperAppSplash(),
//           type: PageTransitionType.fade,
//           duration: const Duration(milliseconds: 1100),
//         );
//       case Routes.NON_LOGIN:
//         return MaterialPageRoute(
//           settings: setting,
//           builder: (_) => const GuestLoginView(),
//         );
//       case Routes.SPLASH:
//         return MaterialPageRoute(
//           settings: setting,
//           builder: (_) => const SplashScreen(),
//         );
//       case Routes.SELECT_LANGUAGE:
//         return MaterialPageRoute(
//           settings: setting,
//           builder: (_) => const SelectLanguageView(),
//         );
    
      
//       default:
//         return MaterialPageRoute(
//           settings: setting,
//           builder: (_) => const LoginPage(),
//         );
//     }
//   }

//   static String? get lastRoute => _lastRoute;
// }

import 'package:flutter/material.dart';
import 'package:nonpms_scanner_project/modules/details/provider/details_provider.dart';
import 'package:nonpms_scanner_project/modules/home/provider/home_provider.dart';
import 'package:nonpms_scanner_project/modules/registration/provider/sign_up_provider.dart';
import 'package:nonpms_scanner_project/modules/splash_screen.dart';
import 'package:nonpms_scanner_project/modules/login/provider/loginProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
                ChangeNotifierProvider(create: (_) => SignUpProvider()), // Replace with your actual providers
        ChangeNotifierProvider(create: (_) => HomeProvider()), // Replace with your actual providers
        ChangeNotifierProvider(create: (_) => DetailsProvider()), // Replace with your actual providers
 // Replace with your actual providers
        // Add more providers as needed
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

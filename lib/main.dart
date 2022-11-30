import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_screen.dart';
import 'screens/home_screen.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
 
  SharedPreferences sp = await SharedPreferences.getInstance();
  bool showHome = sp.getBool("showHome")?? false;
   runApp( MyApp(showHome:showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
   const MyApp({super.key, required this.showHome});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
     
      home:showHome ? const HomeScreen():const OnboardingScreen()
    );
  }
}


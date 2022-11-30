import 'package:flutter/material.dart';
import 'package:orient_app/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Home Screen"),
      actions: [
        IconButton(icon: const Icon(Icons.logout),
        onPressed: () async {
          final prefs = await  SharedPreferences.getInstance();
          prefs.setBool('showHome',false);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen() ,));

        },
        
        )
      ],),
    );
  }
}
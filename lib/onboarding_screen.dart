

import 'package:flutter/material.dart';
import 'package:orient_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controllerP = PageController();
  bool isLastpage = false;
  @override
  void dispose() {
    controllerP.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding:const EdgeInsets.only(bottom:80),
        child: PageView(
          controller: controllerP,
          onPageChanged: (index){
            setState(() {
              isLastpage = index ==2;
            });
          },
          children: [
          buildPage(color: Colors.green.shade100, urlimage: "assets/images/advertise.png", title:"REDUCE1", subtitle: " The  of Lorem Ipsum used since\n the 1500s is reproduced below for\n those interested. Sections Bonorum et\n Malorum"),
          buildPage(color: Colors.blue.shade100, urlimage: "assets/images/advertise.png", title:"RECYCLE2", subtitle: " The  of Lorem Ipsum used since\n the 1500s is reproduced below for\n those interested. Sections Bonorum et\n Malorum"),
          buildPage(color: Colors.green.shade100, urlimage: "assets/images/advertise.png", title:"REDUCE3", subtitle: " The  of Lorem Ipsum used since\n the 1500s is reproduced below for\n those interested. Sections Bonorum et\n Malorum"),
           
            
            

          ],
        ),
      ),
      bottomSheet:isLastpage?TextButton(
       style: TextButton.styleFrom(
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal.shade700,
          minimumSize: const Size.fromHeight(80)
        ),
        onPressed: () async {
          SharedPreferences sp = await SharedPreferences.getInstance();
          sp.setBool("showHome", true);
          Navigator.pushReplacement(context,MaterialPageRoute(builder: ((context) => const HomeScreen())));
        },
        child: const Text(
          "Get Started", style: TextStyle(fontSize: 24),),): Container(height:80,
      padding: const EdgeInsets.symmetric(horizontal:20),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        TextButton(onPressed: (){
          controllerP.jumpToPage(2);
        }, child: const Text("SKIP")),
        SmoothPageIndicator(controller: controllerP, count: 3,
        effect:WormEffect(
          spacing:16,
          dotColor: Colors.black26,
          activeDotColor: Colors.teal.shade700,
        ),
        onDotClicked: ((index) => controllerP.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut)),
        ),
      
        TextButton(onPressed: (() => controllerP.nextPage(duration:const  Duration(milliseconds: 500), curve: Curves.easeInOut)), child:const  Text("NEXT"))
      ],)),

    );
  }

  Widget buildPage({
    required Color color,
    required String urlimage,
    required String title,
    required String subtitle,

  }) => Container(
    color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset(
        color: Colors.green.shade200,
        height:300,
        fit:BoxFit.cover,
        width:double.infinity,
        urlimage),
        const SizedBox(height:64),
        Text(title,style:TextStyle(color:Colors.teal.shade700,fontSize: 32, fontWeight: FontWeight.bold)),
        const SizedBox(height:24),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 40),
          child: Text(subtitle,textAlign: TextAlign.left, style: const TextStyle(color:Colors.black, letterSpacing: 1.0, fontSize: 15),),
        )

    ],),
  );
}
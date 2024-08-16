import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:portfolio/presentation/homescreen/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height to determine responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Define container size based on screen width and height
    double containerSize;
    if (screenWidth >= 1200) {
      // Large screens (web)
      containerSize = 500.0;
    } else if (screenWidth >= 800) {
      // Medium screens (tablets)
      containerSize = 400.0;
    } else {
      // Small screens (phones)
      containerSize = 300.0;
    }

    return Scaffold(
      body: Center(
        child: Container(
          height: containerSize,
          width: containerSize,
          child: RiveAnimation.asset(
            'assets/sda.riv',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

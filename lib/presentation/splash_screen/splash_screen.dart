import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      if (mounted) {
        context.go('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double containerSize;
    if (screenWidth >= 1200) {
      containerSize = 500.0;
    } else if (screenWidth >= 800) {
      containerSize = 400.0;
    } else {
      containerSize = 300.0;
    }

    return Scaffold(
      body: Center(
        child: SizedBox(
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

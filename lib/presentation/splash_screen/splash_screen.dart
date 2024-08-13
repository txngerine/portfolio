// // ignore_for_file: prefer_const_constructors

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:portfolio/presentation/homescreen/view/home_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Timer(Duration(seconds: 4), () {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => HomeScreen(),
//       ));
//     });
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: LottieBuilder.network("lottie/loadon.json"),
//       ),
//     );
//   }
// }

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
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          child: RiveAnimation.asset(
            'assets/sda.riv',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

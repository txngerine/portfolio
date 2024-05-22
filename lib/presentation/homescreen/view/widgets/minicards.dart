// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';

class minicards extends StatelessWidget {
  const minicards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            width: 350,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/download.jpg"))),
          ),
          Text(
            "The Girl Next Door",
            style: NeededTextstyles.ultimate2,
          )
        ],
      ),
    );
  }
}

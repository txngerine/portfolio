// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';

class ContentCard1 extends StatelessWidget {
  const ContentCard1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              "Nice to",
              style: NeededTextstyles.ultimate1,
            ),
            Text(
              "meet you",
              style: NeededTextstyles.ultimate1,
            ),
            SizedBox(
              height: 340,
              width: 500,
            ),
            Text(
              "About me",
              style: NeededTextstyles.ultimate2,
            )
          ],
        ),
        Container(
          height: 650,
          width: 350,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/manga.png"), fit: BoxFit.fill)),
        )
      ],
    );
  }
}

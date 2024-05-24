// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentCard2 extends StatelessWidget {
  const ContentCard2({
    super.key,
  });

  void _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $urlString';
    }
  }

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
              "Flare app for easy navigation and",
              style: NeededTextstyles.ultimatetext,
            ),
            Text(
              "enhanced event experiences.",
              style: NeededTextstyles.ultimatetext,
            ),
            SizedBox(
              height: 340,
              width: 500,
            ),
            InkWell(
              onTap: () {
                _launchURL("https://github.com/nyouibou/flareapp.git");
              },
              child: Row(
                children: [
                  Text(
                    "Flare AR",
                    style: NeededTextstyles.ultimate2,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    'assets/github.svg',
                    height: 30,
                    width: 30,
                  ),
                ],
              ),
            )
          ],
        ),
        Container(
          height: 700,
          width: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/flare.png"), fit: BoxFit.fill)),
        )
      ],
    );
  }
}

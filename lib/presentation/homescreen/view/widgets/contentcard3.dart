// // ignore_for_file: prefer_const_constructors, camel_case_types

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:portfolio/core/constant/textconstant.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ContentCard3 extends StatelessWidget {
//   const ContentCard3({
//     super.key,
//   });

//   void _launchURL(String urlString) async {
//     final Uri url = Uri.parse(urlString);
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not launch $urlString';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 70,
//             ),
//             Text(
//               "Test knowledge, compete,",
//               style: NeededTextstyles.ultimatetext,
//             ),
//             Text(
//               "track  progress,",
//               style: NeededTextstyles.ultimatetext,
//             ),
//             Text(
//               "interactive platform for learning.",
//               style: NeededTextstyles.ultimatetext,
//             ),
//             SizedBox(
//               height: 340,
//               width: 500,
//             ),
//             InkWell(
//               onTap: () {
//                 _launchURL("https://github.com/nyouibou/Quiz_app_main.git");
//               },
//               child: Row(
//                 children: [
//                   Text(
//                     "Quiz App",
//                     style: NeededTextstyles.ultimate2,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   SvgPicture.asset(
//                     'assets/github.svg',
//                     height: 30,
//                     width: 30,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//         Container(
//           height: 650,
//           width: 350,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/emo.png"), fit: BoxFit.fill)),
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentCard3 extends StatelessWidget {
  const ContentCard3({
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
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;

        return isSmallScreen
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Test knowledge, compete,",
                      style: NeededTextstyles.ultimatetext,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "track progress,",
                      style: NeededTextstyles.ultimatetext,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "interactive platform for learning.",
                      style: NeededTextstyles.ultimatetext,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: constraints.maxWidth * 0.8,
                    width: constraints.maxWidth * 0.8,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/emo.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL(
                          "https://github.com/nyouibou/Quiz_app_main.git");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Quiz App",
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
                  ),
                ],
              )
            : Row(
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
                        "Test knowledge, compete,",
                        style: NeededTextstyles.ultimatetext,
                      ),
                      Text(
                        "track progress,",
                        style: NeededTextstyles.ultimatetext,
                      ),
                      Text(
                        "interactive platform for learning.",
                        style: NeededTextstyles.ultimatetext,
                      ),
                      SizedBox(
                        height: 340,
                        width: 500,
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL(
                              "https://github.com/nyouibou/Quiz_app_main.git");
                        },
                        child: Row(
                          children: [
                            Text(
                              "Quiz App",
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
                    height: 650,
                    width: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/emo.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}

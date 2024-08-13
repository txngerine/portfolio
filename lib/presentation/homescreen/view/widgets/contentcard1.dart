// // ignore_for_file: prefer_const_constructors, camel_case_types

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:portfolio/core/constant/textconstant.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ContentCard1 extends StatelessWidget {
//   const ContentCard1({
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
//               "A digital platform for reading and",
//               style: NeededTextstyles.ultimatetext,
//             ),
//             Text(
//               "exploring various manga titles.",
//               style: NeededTextstyles.ultimatetext,
//             ),
//             SizedBox(
//               height: 340,
//               width: 500,
//             ),
//             InkWell(
//               onTap: () {
//                 _launchURL("https://github.com/nyouibou/tachiyomi_clone.git");
//               },
//               child: Row(
//                 children: [
//                   Text(
//                     "MangaVerse",
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
//                   image: AssetImage("assets/manga.png"), fit: BoxFit.fill)),
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentCard1 extends StatelessWidget {
  const ContentCard1({
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
                      "A digital platform for reading and",
                      style: NeededTextstyles.ultimatetext,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "exploring various manga titles.",
                      style: NeededTextstyles.ultimatetext,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: constraints.maxWidth * 0.8,
                    width: constraints.maxWidth * 0.8,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/manga.png"),
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
                          "https://github.com/nyouibou/tachiyomi_clone.git");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "MangaVerse",
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
                        "A digital platform for reading and",
                        style: NeededTextstyles.ultimatetext,
                      ),
                      Text(
                        "exploring various manga titles.",
                        style: NeededTextstyles.ultimatetext,
                      ),
                      SizedBox(
                        height: 340,
                        width: 500,
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL(
                              "https://github.com/nyouibou/tachiyomi_clone.git");
                        },
                        child: Row(
                          children: [
                            Text(
                              "MangaVerse",
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
                        image: AssetImage("assets/manga.png"),
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

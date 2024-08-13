// // ignore_for_file: prefer_const_constructors, unused_local_variable, sort_child_properties_last

// import 'package:flutter/material.dart';
// import 'package:portfolio/core/constant/textconstant.dart';
// import 'package:portfolio/globalwidgets/customappbardark.dart';
// import 'package:portfolio/presentation/about_me_screen/view/widgets/contactscreen_dark.dart';
// import 'package:portfolio/presentation/about_me_screen/view/widgets/expcard.dart';
// import 'package:portfolio/presentation/about_me_screen/view/widgets/skillcard.dart';
// import 'package:portfolio/presentation/about_me_screen/view/widgets/skillcard2.dart';
// import 'package:url_launcher/url_launcher.dart';

// class AboutmeScreen extends StatefulWidget {
//   const AboutmeScreen({Key? key}) : super(key: key);

//   @override
//   State<AboutmeScreen> createState() => _AboutmeScreenState();
// }

// class _AboutmeScreenState extends State<AboutmeScreen> {
//   final ScrollController _scrollController = ScrollController();
//   final ValueNotifier<bool> _isButtonVisible = ValueNotifier(false);
//   final List<Map<String, dynamic>> skills = [
//     {'name': 'Dart', 'level': 0.90},
//     {'name': 'Flutter', 'level': 0.85},
//     {'name': 'Git', 'level': 0.70},
//     {'name': 'Java', 'level': 0.65},
//   ];
//   final List<Map<String, dynamic>> skills2 = [
//     {'name': 'REST API', 'level': 0.72},
//     {'name': 'Firebase', 'level': 0.80},
//     {'name': 'Hive', 'level': 0.70},
//     {'name': 'Provider', 'level': 0.65},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       if (_scrollController.offset >= 100) {
//         _isButtonVisible.value = true;
//       } else {
//         _isButtonVisible.value = false;
//       }
//     });
//   }

//   void _launchURL(String urlString) async {
//     final Uri url = Uri.parse(urlString);
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not launch $urlString';
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _isButtonVisible.dispose();
//     super.dispose();
//   }

//   void _scrollToTop() {
//     _scrollController.animateTo(
//       0,
//       duration: Duration(seconds: 1),
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: CustomAppBarDark(),
//         body: LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints constraints) {
//             double maxWidth = constraints.maxWidth;
//             return SingleChildScrollView(
//               controller: _scrollController,
//               scrollDirection: Axis.vertical,
//               child: Center(
//                 child: Container(
//                   width: maxWidth,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 SizedBox(
//                                   height: 400,
//                                 ),
//                                 Text(
//                                   "Hey there!   ",
//                                   style: NeededTextstyles.ultimatemaxwhite,
//                                   textAlign: TextAlign.end,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             height: 500,
//                             width: 500,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: AssetImage("assets/main.png"),
//                                     fit: BoxFit.fill)),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 1200,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "I'm Akshay T S, a passionate Flutter Developer residing in the picturesque landscapes of Kerala, India. With a love for technology and a flair for creativity, I thrive on crafting seamless digital experiences that blend functionality with aesthetic appeal.",
//                                 style: NeededTextstyles.aboutmecontentwhite,
//                               ),
//                               SizedBox(height: 16),
//                               Text(
//                                 "My journey into the world of Flutter development began with a spark of curiosity, and since then, there's been no looking back. I find joy in exploring the depths of Dart and Flutter, leveraging their power to bring ideas to life in the form of captivating mobile applications.",
//                                 style: NeededTextstyles.aboutmecontentwhite,
//                               ),
//                               SizedBox(height: 16),
//                               Text(
//                                 "Beyond coding, I'm a fervent tech enthusiast, always on the lookout for the latest innovations and trends shaping our digital landscape. Whether it's diving into new frameworks or experimenting with cutting-edge technologies, I'm driven by an insatiable thirst for knowledge and growth.",
//                                 style: NeededTextstyles.aboutmecontentwhite,
//                               ),
//                               SizedBox(height: 16),
//                               Text(
//                                 "But my interests extend beyond the realm of technology. I'm also deeply passionate about digital art, finding solace and expression in the vibrant world of pixels and brushes. From intricate designs to whimsical illustrations, digital art serves as both a creative outlet and a source of inspiration in my life.",
//                                 style: NeededTextstyles.aboutmecontentwhite,
//                               ),
//                               SizedBox(height: 16),
//                               Text(
//                                 "In essence, I'm a blend of a Flutter developer, a tech enthusiast, and a digital artist, weaving together code, creativity, and curiosity to craft experiences that leave a lasting impression. Join me on this journey as we explore the endless possibilities of the digital realm together.",
//                                 style: NeededTextstyles.aboutmecontentwhite,
//                               ),
//                               SizedBox(
//                                 height: 100,
//                               ),

//                               Expcard(),
//                               //newline
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   SkillCard(skills: skills),
//                                   SkillCard2(skills2: skills2),
//                                 ],
//                               ),
//                               Center(
//                                 child: SizedBox(
//                                   height: 100,
//                                   width: 400,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       InkWell(
//                                         onTap: () {
//                                           _launchURL(
//                                               'mailto:akshaits4@gmail.com');
//                                         },
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               color: Colors.white),
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(15.0),
//                                             child: Text(
//                                               "Hire Me",
//                                               style: NeededTextstyles
//                                                   .ultimatex2dark,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           _launchURL(
//                                               'https://drive.google.com/file/d/13-MTP6y4LvoHyvWSmiJ0Ci9uafi0YIa3/view?usp=drive_link');
//                                         },
//                                         // https://drive.google.com/file/d/13-MTP6y4LvoHyvWSmiJ0Ci9uafi0YIa3/view?usp=drive_link
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               color: Colors.white),
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(15.0),
//                                             child: Text(
//                                               "Download CV",
//                                               style: NeededTextstyles
//                                                   .ultimatex2dark,
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 200,
//                       ),
//                       ContactcardDark(),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//         floatingActionButton: ValueListenableBuilder<bool>(
//           valueListenable: _isButtonVisible,
//           builder: (context, isVisible, child) {
//             return isVisible
//                 ? FloatingActionButton(
//                     onPressed: _scrollToTop,
//                     child: Icon(
//                       Icons.arrow_upward,
//                       color: Colors.white,
//                     ),
//                     backgroundColor: Colors.black,
//                   )
//                 : Container();
//           },
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_constructors, unused_local_variable, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/globalwidgets/customappbardark.dart';
import 'package:portfolio/presentation/about_me_screen/view/widgets/contactscreen_dark.dart';
import 'package:portfolio/presentation/about_me_screen/view/widgets/expcard.dart';
import 'package:portfolio/presentation/about_me_screen/view/widgets/skillcard.dart';
import 'package:portfolio/presentation/about_me_screen/view/widgets/skillcard2.dart';
import 'package:portfolio/presentation/contact_screen/contact_screen.dart';
import 'package:portfolio/presentation/homescreen/view/home_screen.dart';
import 'package:portfolio/presentation/project_screen/view/project_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutmeScreen extends StatefulWidget {
  const AboutmeScreen({Key? key}) : super(key: key);

  @override
  State<AboutmeScreen> createState() => _AboutmeScreenState();
}

class _AboutmeScreenState extends State<AboutmeScreen> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _isButtonVisible = ValueNotifier(false);

  final List<Map<String, dynamic>> skills = [
    {'name': 'Dart', 'level': 0.90},
    {'name': 'Flutter', 'level': 0.85},
    {'name': 'Android', 'level': 0.85},
    {'name': 'Bloc', 'level': 0.85},
    {'name': 'Figma', 'level': 0.65},
    {'name': 'Linux', 'level': 0.80},
    {'name': 'Git', 'level': 0.70},
    {'name': 'Java', 'level': 0.65},
  ];

  final List<Map<String, dynamic>> skills2 = [
    {'name': 'REST API', 'level': 0.72},
    {'name': 'Firebase', 'level': 0.80},
    {'name': 'GetX', 'level': 0.80},
    {'name': 'Riverpod', 'level': 0.80},
    {'name': 'Adobe Premier Pro', 'level': 0.80},
    {'name': 'Adobe XD', 'level': 0.60},
    {'name': 'Hive', 'level': 0.70},
    {'name': 'Provider', 'level': 0.65},
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 100) {
        _isButtonVisible.value = true;
      } else {
        _isButtonVisible.value = false;
      }
    });
  }

  void _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $urlString';
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isButtonVisible.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  double _getResponsiveFontSize(BuildContext context, List<double> sizes) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) {
      return sizes[0]; // Large screens
    } else if (screenWidth >= 800) {
      return sizes[1]; // Medium screens
    } else {
      return sizes[2]; // Small screens
    }
  }

  @override
  Widget build(BuildContext context) {
    double aboutmeFontSize = _getResponsiveFontSize(context, [26, 22, 18]);
    double ultimatemaxFontSize = _getResponsiveFontSize(context, [80, 50, 30]);
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBarD(),
        endDrawer: isMobile
            ? Drawer(
                backgroundColor:
                    Colors.black, // Set drawer background color to black
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    _buildDrawerItem(context, 'Home', HomeScreen()),
                    _buildDrawerItem(context, 'About Me', AboutmeScreen()),
                    _buildDrawerItem(context, 'Projects', ProjectScreen()),
                    _buildDrawerItem(context, 'Contact', ContactScreen()),
                  ],
                ),
              )
            : null,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double maxWidth = constraints.maxWidth;
            return SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              child: Center(
                child: Container(
                  width: maxWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (isMobile) ...[
                        Container(
                          height: maxWidth > 800 ? 500 : maxWidth / 1.6,
                          width: maxWidth > 800 ? 500 : maxWidth / 1.6,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/main.png"),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Hey there!   ",
                          style: NeededTextstyles.ultimatemaxwhite
                              .copyWith(fontSize: ultimatemaxFontSize),
                          textAlign: TextAlign.center,
                        ),
                      ] else ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 400,
                                  ),
                                  Text(
                                    "Hey there!   ",
                                    style: NeededTextstyles.ultimatemaxwhite
                                        .copyWith(
                                            fontSize: ultimatemaxFontSize),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: maxWidth > 800 ? 500 : maxWidth / 1.6,
                                width: maxWidth > 800 ? 500 : maxWidth / 1.6,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/main.png"),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ],
                        ),
                      ],
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: maxWidth > 1200 ? 1000 : maxWidth,
                          child: Column(
                            children: [
                              Text(
                                "I'm Akshay T S, a passionate Flutter Developer residing in the picturesque landscapes of Kerala, India. With a love for technology and a flair for creativity, I thrive on crafting seamless digital experiences that blend functionality with aesthetic appeal.",
                                style: NeededTextstyles.aboutmecontentwhite,
                              ),
                              SizedBox(height: 16),
                              Text(
                                "My journey into the world of Flutter development began with a spark of curiosity, and since then, there's been no looking back. I find joy in exploring the depths of Dart and Flutter, leveraging their power to bring ideas to life in the form of captivating mobile applications.",
                                style: NeededTextstyles.aboutmecontentwhite,
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Beyond coding, I'm a fervent tech enthusiast, always on the lookout for the latest innovations and trends shaping our digital landscape. Whether it's diving into new frameworks or experimenting with cutting-edge technologies, I'm driven by an insatiable thirst for knowledge and growth.",
                                style: NeededTextstyles.aboutmecontentwhite,
                              ),
                              SizedBox(height: 16),
                              Text(
                                "But my interests extend beyond the realm of technology. I'm also deeply passionate about digital art, finding solace and expression in the vibrant world of pixels and brushes. From intricate designs to whimsical illustrations, digital art serves as both a creative outlet and a source of inspiration in my life.",
                                style: NeededTextstyles.aboutmecontentwhite,
                              ),
                              SizedBox(height: 16),
                              Text(
                                "In essence, I'm a blend of a Flutter developer, a tech enthusiast, and a digital artist, weaving together code, creativity, and curiosity to craft experiences that leave a lasting impression. Join me on this journey as we explore the endless possibilities of the digital realm together.",
                                style: NeededTextstyles.aboutmecontentwhite,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Expcard(),
                      isMobile
                          ? Column(
                              children: [
                                SkillCard(
                                  skills: skills,
                                ),
                                SkillCard2(
                                  skills2: skills2,
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SkillCard(
                                  skills: skills,
                                ),
                                SkillCard2(
                                  skills2: skills2,
                                ),
                              ],
                            ),
                      SizedBox(height: 32),
                      Center(
                        child: SizedBox(
                          height: 100,
                          width: 400,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  _launchURL('mailto:akshaits4@gmail.com');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "Hire Me",
                                      style: NeededTextstyles.ultimatex2dark,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _launchURL(
                                      'https://drive.google.com/file/d/13-MTP6y4LvoHyvWSmiJ0Ci9uafi0YIa3/view?usp=drive_link');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      "Download CV",
                                      style: NeededTextstyles.ultimatex2dark,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      ContactcardDark(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: ValueListenableBuilder<bool>(
          valueListenable: _isButtonVisible,
          builder: (context, isVisible, child) {
            return AnimatedOpacity(
              opacity: isVisible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: FloatingActionButton(
                onPressed: _scrollToTop,
                child: Icon(Icons.arrow_upward),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String label, Widget screen) {
    return ListTile(
      title: Text(
        label,
        style: NeededTextstyles.Subheading1da.copyWith(color: Colors.white),
      ),
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
    );
  }
}

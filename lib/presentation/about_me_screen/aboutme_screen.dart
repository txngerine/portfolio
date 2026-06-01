import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/core/utils/launch_utils.dart';
import 'package:portfolio/globalwidgets/customappbardark.dart';
import 'package:portfolio/globalwidgets/animations/fade_in_slide.dart';
import 'package:portfolio/presentation/about_me_screen/view/widgets/contactscreen_dark.dart';
import 'package:portfolio/presentation/about_me_screen/view/widgets/expcard.dart';
import 'package:portfolio/presentation/about_me_screen/view/widgets/skillcard.dart';
import 'package:portfolio/presentation/about_me_screen/view/widgets/skillcard2.dart';

class AboutmeScreen extends StatefulWidget {
  const AboutmeScreen({Key? key}) : super(key: key);

  @override
  State<AboutmeScreen> createState() => _AboutmeScreenState();
}

class _AboutmeScreenState extends State<AboutmeScreen> {
  final ScrollController _scrollController = ScrollController();

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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  double _getResponsiveFontSize(BuildContext context, List<double> sizes) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) return sizes[0];
    if (screenWidth >= 800) return sizes[1];
    return sizes[2];
  }

  @override
  Widget build(BuildContext context) {
    double ultimatemaxFontSize = _getResponsiveFontSize(context, [80, 50, 30]);
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBarD(),
        endDrawer: isMobile
            ? Drawer(
                backgroundColor: Colors.black,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    _buildDrawerItem(context, 'Home', '/home'),
                    _buildDrawerItem(context, 'About Me', '/about'),
                    _buildDrawerItem(context, 'Projects', '/projects'),
                    _buildDrawerItem(context, 'Contact', '/contact'),
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
                        FadeInSlide(
                          delay: Duration(milliseconds: 200),
                          child: Container(
                            height: maxWidth / 1.6,
                            width: maxWidth / 1.6,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/main.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        FadeInSlide(
                          delay: Duration(milliseconds: 500),
                          child: Text(
                            "Hey there!",
                            style: NeededTextstyles.ultimatemaxwhite
                                .copyWith(fontSize: ultimatemaxFontSize),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ] else ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: FadeInSlide(
                                delay: Duration(milliseconds: 300),
                                beginOffset: Offset(-40, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 400),
                                    Text(
                                      "Hey there!",
                                      style: NeededTextstyles.ultimatemaxwhite
                                          .copyWith(fontSize: ultimatemaxFontSize),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Flexible(
                              flex: 1,
                              child: FadeInSlide(
                                delay: Duration(milliseconds: 500),
                                beginOffset: Offset(40, 0),
                                child: Container(
                                  height: 500,
                                  width: 500,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/main.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: maxWidth > 1200 ? 1000 : maxWidth,
                          child: Column(
                            children: [
                              FadeInSlide(
                                delay: Duration(milliseconds: 300),
                                child: Text(
                                  "I'm Akshay T S, a passionate Flutter Developer residing in the picturesque landscapes of Kerala, India. With a love for technology and a flair for creativity, I thrive on crafting seamless digital experiences that blend functionality with aesthetic appeal.",
                                  style: NeededTextstyles.aboutmecontentwhite,
                                ),
                              ),
                              SizedBox(height: 16),
                              FadeInSlide(
                                delay: Duration(milliseconds: 400),
                                child: Text(
                                  "My journey into the world of Flutter development began with a spark of curiosity, and since then, there's been no looking back. I find joy in exploring the depths of Dart and Flutter, leveraging their power to bring ideas to life.",
                                  style: NeededTextstyles.aboutmecontentwhite,
                                ),
                              ),
                              SizedBox(height: 16),
                              FadeInSlide(
                                delay: Duration(milliseconds: 500),
                                child: Text(
                                  "Beyond coding, I'm a fervent tech enthusiast, always on the lookout for the latest innovations. Whether it's diving into new frameworks or experimenting with cutting-edge technologies, I'm driven by an insatiable thirst for knowledge.",
                                  style: NeededTextstyles.aboutmecontentwhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      FadeInSlide(
                        delay: Duration(milliseconds: 300),
                        child: Expcard(),
                      ),
                      SizedBox(height: 32),
                      isMobile
                          ? Column(
                              children: [
                                FadeInSlide(
                                  delay: Duration(milliseconds: 300),
                                  child: SkillCard(skills: skills),
                                ),
                                SizedBox(height: 16),
                                FadeInSlide(
                                  delay: Duration(milliseconds: 500),
                                  child: SkillCard2(skills2: skills2),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FadeInSlide(
                                  delay: Duration(milliseconds: 300),
                                  beginOffset: Offset(-30, 0),
                                  child: SkillCard(skills: skills),
                                ),
                                FadeInSlide(
                                  delay: Duration(milliseconds: 500),
                                  beginOffset: Offset(30, 0),
                                  child: SkillCard2(skills2: skills2),
                                ),
                              ],
                            ),
                      SizedBox(height: 48),
                      FadeInSlide(
                        delay: Duration(milliseconds: 400),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => launchURL('mailto:${AppConstants.email}'),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    "Hire Me",
                                    style: NeededTextstyles.ultimatex2dark,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              InkWell(
                                onTap: () => launchURL(
                                    'https://drive.google.com/file/d/14ip97V-kMH0YKQnKYeTsFJ0jPkrGuLnX/view?usp=drive_link'),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    "Download CV",
                                    style: NeededTextstyles.ultimatex2dark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 48),
                      FadeInSlide(
                        delay: Duration(milliseconds: 300),
                        beginOffset: Offset(0, 50),
                        child: ContactcardDark(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String label, String route) {
    return ListTile(
      title: Text(
        label,
        style: NeededTextstyles.Subheading1da.copyWith(color: Colors.white),
      ),
      onTap: () => context.go(route),
    );
  }
}

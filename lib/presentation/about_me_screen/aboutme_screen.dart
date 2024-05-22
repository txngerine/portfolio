// ignore_for_file: prefer_const_constructors, unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/globalwidgets/customappbardark.dart';
import 'package:portfolio/presentation/about_me_screen/view/widgets/contactscreen_dark.dart';

class AboutmeScreen extends StatefulWidget {
  const AboutmeScreen({Key? key}) : super(key: key);

  @override
  State<AboutmeScreen> createState() => _AboutmeScreenState();
}

class _AboutmeScreenState extends State<AboutmeScreen> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _isButtonVisible = ValueNotifier(false);

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBarDark(),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 400,
                                ),
                                Text(
                                  "Hey there!   ",
                                  style: NeededTextstyles.ultimatemaxwhite,
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 500,
                            width: 500,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/main.png"),
                                    fit: BoxFit.fill)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1000,
                        width: 1200,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
            return isVisible
                ? FloatingActionButton(
                    onPressed: _scrollToTop,
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                  )
                : Container();
          },
        ),
      ),
    );
  }
}

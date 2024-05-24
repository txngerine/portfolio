// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/globalwidgets/customappbar.dart';
import 'package:portfolio/globalwidgets/contactcard.dart';
import 'package:portfolio/presentation/about_me_screen/aboutme_screen.dart';
import 'package:portfolio/presentation/homescreen/view/widgets/contentcard1.dart';
import 'package:portfolio/presentation/homescreen/view/widgets/contentcard2.dart';
import 'package:portfolio/presentation/homescreen/view/widgets/contentcard3.dart';
import 'package:portfolio/presentation/homescreen/view/widgets/firstcard.dart';
import 'package:portfolio/presentation/homescreen/view/widgets/respcard.dart';
import 'package:portfolio/presentation/homescreen/view/widgets/spacegiven.dart';
import 'package:portfolio/presentation/project_screen/view/project_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isButtonVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double maxWidth = constraints.maxWidth;
            return SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 230,
                  ),
                  firstcard(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutmeScreen(),
                            ));
                      },
                      child: Container(
                        height: 700,
                        width: maxWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.4),
                        ),
                        child: repcard(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: maxWidth * 0.8,
                    child: Center(
                      child: Text(
                        "By developing efficient Flutter frameworks, I continuously refine my skills to build high-quality, performant applications.",
                        style: NeededTextstyles.ultimate2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 700,
                      width: maxWidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.withOpacity(0.2),
                      ),
                      child: ContentCard1(),
                    ),
                  ),
                  spacebargiven(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 700,
                      width: maxWidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.withOpacity(0.2),
                      ),
                      child: ContentCard2(),
                    ),
                  ),
                  spacebargiven(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 700,
                      width: maxWidth * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.withOpacity(0.2),
                      ),
                      child: ContentCard3(),
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    width: maxWidth * 0.8,
                    child: Center(
                      child: Text(
                        "These are just the samples,wanna see more.",
                        style: NeededTextstyles.ultimate3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProjectScreen(),
                          ));
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Show more Projects",
                            style: NeededTextstyles.littletext,
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 230,
                  ),
                  Contactcard()
                ],
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

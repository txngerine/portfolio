import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/globalwidgets/customappbar.dart';
import 'package:portfolio/globalwidgets/contactcard.dart';
import 'package:portfolio/globalwidgets/animations/fade_in_slide.dart';
import 'package:portfolio/presentation/homescreen/view/widgets/contentcard1.dart';
import 'package:portfolio/presentation/homescreen/view/widgets/contentcard2.dart';
import 'package:portfolio/presentation/homescreen/view/widgets/contentcard3.dart';
import 'package:portfolio/presentation/homescreen/view/widgets/firstcard.dart';
import 'package:portfolio/presentation/homescreen/view/widgets/respcard.dart';
import 'package:portfolio/presentation/homescreen/view/widgets/spacegiven.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Text('Menu', style: NeededTextstyles.heading1),
            ),
            ListTile(
              title: Text('Home', style: NeededTextstyles.heading1),
              onTap: () => context.go('/home'),
            ),
            ListTile(
              title: Text('About Me', style: NeededTextstyles.heading1),
              onTap: () => context.go('/about'),
            ),
            ListTile(
              title: Text('Projects', style: NeededTextstyles.heading1),
              onTap: () => context.go('/projects'),
            ),
            ListTile(
              title: Text('Contact', style: NeededTextstyles.heading1),
              onTap: () => context.go('/contact'),
            ),
          ],
        ),
      ),
      body: ResponsiveContent(),
    );
  }
}

class ResponsiveContent extends StatefulWidget {
  @override
  _ResponsiveContentState createState() => _ResponsiveContentState();
}

class _ResponsiveContentState extends State<ResponsiveContent> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isSmall = maxWidth < 600;

    TextStyle responsiveTextStyle(TextStyle baseStyle) {
      return baseStyle.copyWith(
        fontSize: isSmall ? 24.0 : 34.0,
      );
    }

    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.15),

          FadeInSlide(
            delay: Duration(milliseconds: 200),
            child: FirstCard(),
          ),

          const SizedBox(height: 40),

          FadeInSlide(
            delay: Duration(milliseconds: 500),
            beginOffset: Offset(0, 60),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => context.push('/about'),
                child: Tilt(
                  tiltConfig: TiltConfig(angle: 15),
                  child: Container(
                    height: isSmall ? 400 : 700,
                    width: maxWidth * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    child: RepCard(),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 60),

          FadeInSlide(
            delay: Duration(milliseconds: 300),
            child: Container(
              constraints: BoxConstraints(maxWidth: 800),
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "By developing efficient Flutter frameworks, I continuously refine my skills to build high-quality, performant applications.",
                style: responsiveTextStyle(NeededTextstyles.ultimate2),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          const SizedBox(height: 80),

          FadeInSlide(
            delay: Duration(milliseconds: 200),
            beginOffset: Offset(-40, 0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Tilt(
                tiltConfig: TiltConfig(angle: 15),
                child: Container(
                  height: isSmall ? 400 : 700,
                  width: maxWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.withOpacity(0.2),
                  ),
                  child: ContentCard1(),
                ),
              ),
            ),
          ),

          spacebargiven(),

          FadeInSlide(
            delay: Duration(milliseconds: 200),
            beginOffset: Offset(40, 0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Tilt(
                tiltConfig: TiltConfig(angle: 15),
                child: Container(
                  height: isSmall ? 400 : 700,
                  width: maxWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.withOpacity(0.2),
                  ),
                  child: ContentCard2(),
                ),
              ),
            ),
          ),

          spacebargiven(),

          FadeInSlide(
            delay: Duration(milliseconds: 200),
            beginOffset: Offset(-40, 0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Tilt(
                tiltConfig: TiltConfig(angle: 15),
                child: Container(
                  height: isSmall ? 400 : 700,
                  width: maxWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.withOpacity(0.4),
                  ),
                  child: ContentCard3(),
                ),
              ),
            ),
          ),

          const SizedBox(height: 60),

          FadeInSlide(
            delay: Duration(milliseconds: 300),
            child: Container(
              constraints: BoxConstraints(maxWidth: 600),
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "These are just the samples, wanna see more.",
                style: responsiveTextStyle(NeededTextstyles.ultimate2),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          const SizedBox(height: 32),

          FadeInSlide(
            delay: Duration(milliseconds: 400),
            child: InkWell(
              onTap: () => context.push('/projects'),
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
          ),

          const SizedBox(height: 120),

          FadeInSlide(
            delay: Duration(milliseconds: 300),
            beginOffset: Offset(0, 50),
            child: Contactcard(),
          ),
        ],
      ),
    );
  }
}

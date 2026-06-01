import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';

class RepCard extends StatelessWidget {
  const RepCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;
        bool isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1024;

        TextStyle responsiveTextStyle(TextStyle baseStyle) {
          double fontSize;

          if (isSmallScreen) {
            fontSize = 24.0;
          } else if (isTablet) {
            fontSize = 32.0;
          } else {
            fontSize = 50.0;
          }

          return baseStyle.copyWith(
            fontSize: fontSize,
          );
        }

        double imageSize() {
          if (isSmallScreen) {
            return constraints.maxWidth * 0.8;
          } else if (isTablet) {
            return constraints.maxWidth * 0.5;
          } else {
            return 700.0;
          }
        }

        return isSmallScreen
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Nice to",
                      style: responsiveTextStyle(NeededTextstyles.ultimate1),
                    ),
                    Text(
                      "meet you",
                      style: responsiveTextStyle(NeededTextstyles.ultimate1),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: imageSize(),
                      width: imageSize(),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/main.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "About me",
                      style: responsiveTextStyle(NeededTextstyles.ultimate2),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
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
                          style:
                              responsiveTextStyle(NeededTextstyles.ultimate1),
                        ),
                        Text(
                          "meet you",
                          style:
                              responsiveTextStyle(NeededTextstyles.ultimate1),
                        ),
                        SizedBox(
                          height: 340,
                        ),
                        Text(
                          "About me",
                          style:
                              responsiveTextStyle(NeededTextstyles.ultimate2),
                        ),
                      ],
                    ),
                    Container(
                      height: imageSize(),
                      width: imageSize(),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/main.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}

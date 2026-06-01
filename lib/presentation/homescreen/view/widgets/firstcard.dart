import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';

class FirstCard extends StatelessWidget {
  const FirstCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    TextStyle responsiveTextStyle(TextStyle baseStyle) {
      return baseStyle.copyWith(
        fontSize: screenWidth < 600 ? 30.0 : 60.0,
      );
    }

    double responsiveHeight() {
      return screenWidth < 600 ? 300.0 : 500.0;
    }

    return Center(
      child: SizedBox(
        height: responsiveHeight(),
        width: 960,
        child: Column(
          children: [
            Text(
              "UI/UX designer, Flutter Developer crafting seamless and engaging mobile experiences.",
              style: responsiveTextStyle(NeededTextstyles.ultimate1),
              textAlign: TextAlign.center,
            ),
            Text(
              "",
              style: responsiveTextStyle(NeededTextstyles.ultimate1),
            ),
          ],
        ),
      ),
    );
  }
}

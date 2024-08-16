import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';

class Expcard extends StatelessWidget {
  const Expcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width to determine responsiveness
    double screenWidth = MediaQuery.of(context).size.width;

    // Define font sizes based on screen width
    double ultimatemaxFontSize;
    double littletextdarkFontSize;
    EdgeInsetsGeometry padding;
    MainAxisAlignment rowAlignment;
    double spacing;

    if (screenWidth >= 1200) {
      // Large screens (web)
      ultimatemaxFontSize = 80.0;
      littletextdarkFontSize = 14.0;
      padding = const EdgeInsets.all(24.0);
      rowAlignment = MainAxisAlignment.spaceAround;
      spacing = 30.0;
    } else if (screenWidth >= 800) {
      // Medium screens (tablets)
      ultimatemaxFontSize = 60.0;
      littletextdarkFontSize = 12.0;
      padding = const EdgeInsets.all(16.0);
      rowAlignment = MainAxisAlignment.spaceBetween;
      spacing = 20.0;
    } else {
      // Small screens (phones)
      ultimatemaxFontSize = 40.0;
      littletextdarkFontSize = 10.0;
      padding = const EdgeInsets.all(12.0);
      rowAlignment = MainAxisAlignment.spaceBetween;
      spacing = 15.0;
    }

    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: rowAlignment,
        children: [
          Expanded(child: _buildInfoColumn("1", "year of\nexperience", ultimatemaxFontSize, littletextdarkFontSize)),
          SizedBox(width: spacing),
          Expanded(child: _buildInfoColumn("10", "projects\ncompleted", ultimatemaxFontSize, littletextdarkFontSize)),
          SizedBox(width: spacing),
          Expanded(child: _buildInfoColumn("16", "technologies\nmastered", ultimatemaxFontSize, littletextdarkFontSize)),
          SizedBox(width: spacing),
          Expanded(child: _buildInfoColumn("198", "number of\ncommits", ultimatemaxFontSize, littletextdarkFontSize)),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String number, String text, double numberFontSize, double textFontSize) {
    return Column(
      children: [
        Text(
          number,
          style: NeededTextstyles.ultimatemaxwhite.copyWith(fontSize: numberFontSize),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: NeededTextstyles.littletextdark.copyWith(fontSize: textFontSize),
        ),
      ],
    );
  }
}

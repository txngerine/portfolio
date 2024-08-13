// import 'package:flutter/material.dart';
// import 'package:portfolio/core/constant/textconstant.dart';

// class Expcard extends StatelessWidget {
//   const Expcard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Text(
//                 "1",
//                 style: NeededTextstyles.ultimatemaxwhite,
//               ),
//               SizedBox(width: 5),
//               Text(
//                 "year of\nexperience",
//                 style: NeededTextstyles.littletextdark,
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Text(
//                 "10",
//                 style: NeededTextstyles.ultimatemaxwhite,
//               ),
//               SizedBox(width: 5),
//               Text(
//                 "projects\ncompleted",
//                 style: NeededTextstyles.littletextdark,
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Text(
//                 "8",
//                 style: NeededTextstyles.ultimatemaxwhite,
//               ),
//               SizedBox(width: 5),
//               Text(
//                 "technologies\nmastered",
//                 style: NeededTextstyles.littletextdark,
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Text(
//                 "100",
//                 style: NeededTextstyles.ultimatemaxwhite,
//               ),
//               SizedBox(width: 5),
//               Text(
//                 "number of\ncommits",
//                 style: NeededTextstyles.littletextdark,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

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

    if (screenWidth >= 1200) {
      // Large screens
      ultimatemaxFontSize = 80.0;
      littletextdarkFontSize = 14.0;
    } else if (screenWidth >= 800) {
      // Medium screens
      ultimatemaxFontSize = 60.0;
      littletextdarkFontSize = 12.0;
    } else {
      // Small screens
      ultimatemaxFontSize = 40.0;
      littletextdarkFontSize = 10.0;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoColumn("1", "year of\nexperience", ultimatemaxFontSize,
              littletextdarkFontSize),
          _buildInfoColumn("10", "projects\ncompleted", ultimatemaxFontSize,
              littletextdarkFontSize),
          _buildInfoColumn("16", "technologies\nmastered", ultimatemaxFontSize,
              littletextdarkFontSize),
          _buildInfoColumn("198", "number of\ncommits", ultimatemaxFontSize,
              littletextdarkFontSize),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(
      String number, String text, double numberFontSize, double textFontSize) {
    return Column(
      children: [
        Text(
          number,
          style: NeededTextstyles.ultimatemaxwhite
              .copyWith(fontSize: numberFontSize),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style:
              NeededTextstyles.littletextdark.copyWith(fontSize: textFontSize),
        ),
      ],
    );
  }
}

// // ignore_for_file: prefer_const_constructors, camel_case_types

// import 'package:flutter/material.dart';
// import 'package:portfolio/core/constant/textconstant.dart';

// class repcard extends StatelessWidget {
//   const repcard({
//     super.key,
//   });

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
//               "Nice to",
//               style: NeededTextstyles.ultimate1,
//             ),
//             Text(
//               "meet you",
//               style: NeededTextstyles.ultimate1,
//             ),
//             SizedBox(
//               height: 340,
//             ),
//             Text(
//               "About me",
//               style: NeededTextstyles.ultimate2,
//             )
//           ],
//         ),
//         Container(
//           height: 700,
//           width: 700,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/main.png"), fit: BoxFit.fill)),
//         )
//       ],
//     );
//   }
// }
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

        // Define responsive text style
        TextStyle responsiveTextStyle(TextStyle baseStyle) {
          return baseStyle.copyWith(
            fontSize: isSmallScreen
                ? 40.0
                : 50.0, // Adjust font sizes: smaller for mobile
          );
        }

        // Define responsive image size
        double imageSize() {
          return isSmallScreen ? constraints.maxWidth * 0.8 : 700.0;
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

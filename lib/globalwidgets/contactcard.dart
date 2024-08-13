// import 'package:flutter/material.dart';
// import 'package:portfolio/core/constant/textconstant.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Contactcard extends StatelessWidget {
//   const Contactcard({
//     super.key,
//   });

//   void _launchURL(String urlString) async {
//     final Uri url = Uri.parse(urlString);
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not launch $urlString';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       width: 1200,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Row(
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Let's connect ",
//                         style: NeededTextstyles.ultimatemax,
//                       ),
//                       Text(
//                         "digitally",
//                         style: NeededTextstyles.ultimatemax,
//                       ),
//                       SizedBox(
//                         height: 100,
//                       ),
//                       Text(
//                         "© 2024 AKSHAY TS",
//                         style: NeededTextstyles.littletext,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 440,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           _launchURL('mailto:akshaits4@gmail.com');
//                         },
//                         child: Text(
//                           "Email",
//                           style: NeededTextstyles.contactsname,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           _launchURL('https://instagram.com/akshaiiii.i');
//                         },
//                         child: Text(
//                           "Instagram",
//                           style: NeededTextstyles.contactsname,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           _launchURL('https://twitter.com/yourusername');
//                         },
//                         child: Text(
//                           "Twitter",
//                           style: NeededTextstyles.contactsname,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           _launchURL('https://github.com/nyouibou');
//                         },
//                         child: Text(
//                           "Github",
//                           style: NeededTextstyles.contactsname,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           _launchURL('https://linkedin.com/in/akshai-t-s');
//                         },
//                         child: Text(
//                           "LinkedIn",
//                           style: NeededTextstyles.contactsname,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
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
import 'package:url_launcher/url_launcher.dart';

class Contactcard extends StatelessWidget {
  const Contactcard({
    super.key,
  });

  void _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $urlString';
    }
  }

  // Helper method to get responsive text size
  double _getResponsiveFontSize(
      BuildContext context, double baseFontSize, List<double> sizes) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) {
      return sizes[0]; // Large screens
    } else if (screenWidth >= 800) {
      return sizes[1]; // Medium screens
    } else {
      return sizes[2]; // Small screens
    }
  }

  // Helper method to get responsive width
  double _getResponsiveWidth(BuildContext context, List<double> widths) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1200) {
      return widths[0]; // Large screens
    } else if (screenWidth >= 800) {
      return widths[1]; // Medium screens
    } else {
      return widths[2]; // Small screens
    }
  }

  @override
  Widget build(BuildContext context) {
    double ultimatemaxFontSize =
        _getResponsiveFontSize(context, 80.0, [80, 50, 20]);
    double contactsnameFontSize =
        _getResponsiveFontSize(context, 45.0, [45, 25, 15]);
    double littletextFontSize =
        _getResponsiveFontSize(context, 14.0, [14, 10, 8]);
    double sizedBoxWidth = _getResponsiveWidth(context, [440, 300, 150]);

    return Container(
      // height: 500,
      width: double.infinity, // Adjust width as per your design
      padding: EdgeInsets.all(16.0), // Add some padding for better spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's connect ",
                      style: NeededTextstyles.ultimatemax
                          .copyWith(fontSize: ultimatemaxFontSize),
                    ),
                    Text(
                      "digitally",
                      style: NeededTextstyles.ultimatemax
                          .copyWith(fontSize: ultimatemaxFontSize),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "© 2024 AKSHAY TS",
                      style: NeededTextstyles.littletext
                          .copyWith(fontSize: littletextFontSize),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: sizedBoxWidth,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      _launchURL('mailto:akshaits4@gmail.com');
                    },
                    child: Text(
                      "Email",
                      style: NeededTextstyles.contactsname
                          .copyWith(fontSize: contactsnameFontSize),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL('https://instagram.com/akshaiiii.i');
                    },
                    child: Text(
                      "Instagram",
                      style: NeededTextstyles.contactsname
                          .copyWith(fontSize: contactsnameFontSize),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL('https://twitter.com/yourusername');
                    },
                    child: Text(
                      "Twitter",
                      style: NeededTextstyles.contactsname
                          .copyWith(fontSize: contactsnameFontSize),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL('https://github.com/nyouibou');
                    },
                    child: Text(
                      "Github",
                      style: NeededTextstyles.contactsname
                          .copyWith(fontSize: contactsnameFontSize),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURL('https://linkedin.com/in/akshai-t-s');
                    },
                    child: Text(
                      "LinkedIn",
                      style: NeededTextstyles.contactsname
                          .copyWith(fontSize: contactsnameFontSize),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

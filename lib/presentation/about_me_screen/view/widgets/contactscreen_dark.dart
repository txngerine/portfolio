import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactcardDark extends StatelessWidget {
  const ContactcardDark({
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 500,
      width: 1200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's connect ",
                        style: NeededTextstyles.ultimatemaxwhite,
                      ),
                      Text(
                        "digitally",
                        style: NeededTextstyles.ultimatemaxwhite,
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        "© 2024 AKSHAY TS",
                        style: NeededTextstyles.littletextdark,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 440,
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
                          style: NeededTextstyles.contactsnamedark,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL('https://instagram.com/akshaiiii.i');
                        },
                        child: Text(
                          "Instagram",
                          style: NeededTextstyles.contactsnamedark,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL('https://twitter.com/yourusername');
                        },
                        child: Text(
                          "Twitter",
                          style: NeededTextstyles.contactsnamedark,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL('https://github.com/nyouibou');
                        },
                        child: Text(
                          "Github",
                          style: NeededTextstyles.contactsnamedark,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURL('https://linkedin.com/in/akshai-t-s');
                        },
                        child: Text(
                          "LinkedIn",
                          style: NeededTextstyles.contactsnamedark,
                        ),
                      ),
                    ],
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

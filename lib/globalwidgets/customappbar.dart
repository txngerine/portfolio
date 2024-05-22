// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/presentation/about_me_screen/aboutme_screen.dart';
import 'package:portfolio/presentation/contact_screen/contact_screen.dart';
import 'package:portfolio/presentation/homescreen/view/home_screen.dart';
import 'package:portfolio/presentation/project_screen/view/project_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Akshay T S",
              style: NeededTextstyles.heading1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  child: Text(
                    "Home",
                    style: NeededTextstyles.Subheading1,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutmeScreen(),
                        ));
                  },
                  child: Text(
                    "About Me",
                    style: NeededTextstyles.Subheading1,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProjectScreen(),
                        ));
                  },
                  child: Text(
                    "Projects",
                    style: NeededTextstyles.Subheading1,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactScreen(),
                        ));
                  },
                  child: Text(
                    "Contact",
                    style: NeededTextstyles.Subheading1,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

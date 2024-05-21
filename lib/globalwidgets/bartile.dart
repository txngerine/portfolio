import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';

class bartiles extends StatelessWidget {
  const bartiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Akshay T S",
          style: NeededTextstyles.heading1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "About",
              style: NeededTextstyles.Subheading1,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Experiences",
              style: NeededTextstyles.Subheading1,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Work",
              style: NeededTextstyles.Subheading1,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Contact",
              style: NeededTextstyles.Subheading1,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        )
      ],
    );
  }
}

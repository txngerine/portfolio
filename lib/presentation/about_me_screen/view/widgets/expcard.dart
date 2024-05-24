import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';

class Expcard extends StatelessWidget {
  const Expcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "1",
              style: NeededTextstyles.ultimatemaxwhite,
            ),
            SizedBox(width: 5),
            Text(
              "year of\nexperience",
              style: NeededTextstyles.littletextdark,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "10",
              style: NeededTextstyles.ultimatemaxwhite,
            ),
            SizedBox(width: 5),
            Text(
              "projects\ncompleted",
              style: NeededTextstyles.littletextdark,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "8",
              style: NeededTextstyles.ultimatemaxwhite,
            ),
            SizedBox(width: 5),
            Text(
              "technologies\nmastered",
              style: NeededTextstyles.littletextdark,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "100",
              style: NeededTextstyles.ultimatemaxwhite,
            ),
            SizedBox(width: 5),
            Text(
              "number of\ncommits",
              style: NeededTextstyles.littletextdark,
            ),
          ],
        ),
      ],
    );
  }
}

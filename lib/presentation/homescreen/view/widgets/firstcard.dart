import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';

class firstcard extends StatelessWidget {
  const firstcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 500,
        width: 960,
        child: Column(
          children: [
            Text(
              "UI/UX Flutter designer crafting seamless and engaging mobile experiences.",
              style: NeededTextstyles.ultimate1,
              textAlign: TextAlign.center,
            ),
            Text(
              "",
              style: NeededTextstyles.ultimate1,
            ),
          ],
        ),
      ),
    );
  }
}

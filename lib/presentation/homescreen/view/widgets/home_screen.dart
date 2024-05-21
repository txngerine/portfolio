// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/globalwidgets/bartile.dart';
import 'package:portfolio/presentation/homescreen/view/widgets/firstcard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: bartiles(),
                  ),
                  SizedBox(
                    height: 230,
                  ),
                  firstcard(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 500,
                      width: 1080,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: 960,
                    child: Center(
                      child: Text(
                        "By designing accessible design systems, I help product designers to create inclusive experiences.",
                        style: NeededTextstyles.ultimate2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 500,
                      width: 1080,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 500,
                      width: 1080,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 500,
                      width: 1080,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: 960,
                    child: Center(
                      child: Text(
                        "Occasionally I write design related insights to help designers improve their skills.",
                        style: NeededTextstyles.ultimate2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: GridView.builder(
                  //     itemCount: 3,
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         mainAxisSpacing: 15,
                  //         mainAxisExtent: 254,
                  //         crossAxisSpacing: 15,
                  //         crossAxisCount: 3),
                  //     itemBuilder: (context, index) => Container(
                  //       height: 100,
                  //       width: 100,
                  //       color: Colors.blueGrey,
                  //     ),
                  //   ),
                  //)
                  SizedBox(
                    height: 400,
                    width: 1000,
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) => Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey,
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 500,
                      width: 1000,
                      child: Center(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Let's connect ",
                                          style: NeededTextstyles.ultimatemax,
                                        ),
                                        Text(
                                          "digitally",
                                          style: NeededTextstyles.ultimatemax,
                                        ),
                                        SizedBox(
                                          height: 100,
                                        ),
                                        Text(
                                          "© 2024 AKSHAY TS",
                                          style: NeededTextstyles.littletext,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 200,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Email",
                                          style: NeededTextstyles.ultimate1,
                                        ),
                                        Text(
                                          "Instagram",
                                          style: NeededTextstyles.ultimate1,
                                        ),
                                        Text(
                                          "Twitter",
                                          style: NeededTextstyles.ultimate1,
                                        ),
                                        Text(
                                          "Github",
                                          style: NeededTextstyles.ultimate1,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:math'; // For random color generation
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gif_view/gif_view.dart';
import 'package:portfolio/repository/model/githubmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final GitHubProject project;

  ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  final GifController _controller = GifController();
  Color _containerColor = Colors.white;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    // Timer for periodically changing the container color with opacity of 0.4
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _containerColor = Color.fromRGBO(
          200 + _random.nextInt(56), // Lighter color range
          200 + _random.nextInt(56),
          200 + _random.nextInt(56),
          0.4, // Set opacity to 0.4
        );
      });
    });
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;

        // Define responsive text style
        TextStyle responsiveTextStyle(TextStyle baseStyle) {
          return baseStyle.copyWith(
            fontSize: isSmallScreen ? 20.0 : 30.0,
            color: Colors.black87, // Darker text for contrast on light background
          );
        }

        // Define responsive image size
        double imageSize() {
          return isSmallScreen ? constraints.maxWidth * 0.6 : 200.0;
        }

        return Container(
          padding: EdgeInsets.all(isSmallScreen ? 16.0 : 32.0),
          decoration: BoxDecoration(
            color: _containerColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: isSmallScreen
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.project.name ?? "No Project Name", // Project name from model
                      style: responsiveTextStyle(
                          TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      widget.project.description ?? 'No description available', // Project description from model
                      style: responsiveTextStyle(TextStyle()),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: imageSize(),
                      width: imageSize(),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/android.gif"), // Static image for now
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () => _launchURL(widget.project.htmlUrl), // GitHub link from model
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "View on GitHub",
                            style: TextStyle(fontSize: 16, color: Colors.blue),
                          ),
                          SizedBox(width: 10),
                          SvgPicture.asset(
                            'assets/github.svg',
                            height: 30,
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 70),
                        Text(
                          widget.project.name ?? "No Project Name", // Project name from model
                          style: responsiveTextStyle(
                              TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          widget.project.description ?? 'No description available', // Project description from model
                          style: responsiveTextStyle(TextStyle()),
                        ),
                        SizedBox(height: 340),
                        InkWell(
                          onTap: () => _launchURL(widget.project.htmlUrl), // GitHub link from model
                          child: Row(
                            children: [
                              Text(
                                "View on GitHub",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.blue),
                              ),
                              SizedBox(width: 10),
                              SvgPicture.asset(
                                'assets/github.svg',
                                height: 30,
                                width: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: imageSize(),
                      width: imageSize(),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/android.gif"), // Static image for now
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

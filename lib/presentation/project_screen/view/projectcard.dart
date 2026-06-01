import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gif_view/gif_view.dart';
import 'package:portfolio/repository/model/githubmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final GitHubProject project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

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
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _containerColor = Color.fromRGBO(
          200 + _random.nextInt(56),
          200 + _random.nextInt(56),
          200 + _random.nextInt(56),
          0.4,
        );
      });
    });
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;

        TextStyle responsiveTextStyle(TextStyle baseStyle) {
          return baseStyle.copyWith(
            fontSize: isSmallScreen ? 20.0 : 30.0,
            color: Colors.black87,
          );
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
                      widget.project.name,
                      style: responsiveTextStyle(
                          TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      widget.project.description,
                      style: responsiveTextStyle(TextStyle()),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () => _launchURL(widget.project.htmlUrl),
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
                          widget.project.name,
                          style: responsiveTextStyle(
                              TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          widget.project.description,
                          style: responsiveTextStyle(TextStyle()),
                        ),
                        SizedBox(height: 340),
                        InkWell(
                          onTap: () => _launchURL(widget.project.htmlUrl),
                          child: Row(
                            children: [
                              Text(
                                "View on GitHub",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.blue),
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

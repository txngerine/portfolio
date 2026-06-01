import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/utils/launch_utils.dart';
import 'package:portfolio/repository/model/githubmodel.dart';

class ProjectCard extends StatelessWidget {
  final GitHubProject project;

  const ProjectCard({Key? key, required this.project}) : super(key: key);

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
            color: Colors.white.withOpacity(0.1),
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
                      project.name,
                      style: responsiveTextStyle(
                          TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      project.description,
                      style: responsiveTextStyle(TextStyle()),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () => launchURL(project.htmlUrl),
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
                          project.name,
                          style: responsiveTextStyle(
                              TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          project.description,
                          style: responsiveTextStyle(TextStyle()),
                        ),
                        SizedBox(height: 340),
                        InkWell(
                          onTap: () => launchURL(project.htmlUrl),
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
}

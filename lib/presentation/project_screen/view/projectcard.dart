import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gif_view/gif_view.dart'; // Import gif_view package
import 'package:portfolio/repository/model/githubmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final GitHubProject project;

  // Initialize GifController
  final GifController _controller = GifController();

   ProjectCard({Key? key, required this.project}) : super(key: key);

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              Text(
                project.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                project.description ?? 'No description',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 340),
              InkWell(
                onTap: () {
                  _launchURL(project.htmlUrl);
                },
                child: Row(
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
          ),
          GifView.asset(
            "assets/android.gif",
            controller: _controller, // Assign controller
            height: 200,
            width: 200,
          ),
        ],
      ),
    );
  }
}

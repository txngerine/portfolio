import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio/globalwidgets/customappbar.dart';
import 'package:portfolio/globalwidgets/contactcard.dart';
import 'package:portfolio/repository/githubservice.dart';
import 'package:portfolio/repository/model/githubmodel.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import '../../../core/constant/textconstant.dart';
import '../../about_me_screen/aboutme_screen.dart';
import '../../contact_screen/contact_screen.dart';
import '../../homescreen/view/home_screen.dart';
import 'projectcard.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _isButtonVisible = ValueNotifier(false);
  late Future<List<GitHubProject>> _projectsFuture;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _isButtonVisible.value = _scrollController.offset >= 100;
    });

    _projectsFuture = GitHubService('Nyouibou').fetchProjects();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isButtonVisible.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromARGB(
      102, // Alpha value for 0.4 opacity
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        endDrawer: _buildDrawer(), // Use endDrawer for right-side drawer
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double maxWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;

            return SingleChildScrollView(
              controller: _scrollController,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.1), // Adjust based on screen size
                    FutureBuilder<List<GitHubProject>>(
                      future: _projectsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (snapshot.hasData) {
                          final projects = snapshot.data!;
                          return Wrap(
                            spacing: 16.0, // Horizontal space between cards
                            runSpacing: 16.0, // Vertical space between cards
                            children: projects.map((project) {
                              return SizedBox(
                                width: min(maxWidth * 0.9, 1400), // Responsive width with max limit
                                child: Padding(
                                  padding: const EdgeInsets.all(8.5),
                                  child: Tilt(
                                    tiltConfig: TiltConfig(
                                      angle: 20, // Adjust the tilt angle
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: _generateRandomColor(), // Assign a random color with opacity
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ProjectCard(project: project),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        } else {
                          return Center(child: Text('No projects found.'));
                        }
                      },
                    ),
                    SizedBox(height: screenHeight * 0.1), // Additional spacing before the contact card
                    Contactcard(),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: ValueListenableBuilder<bool>(
          valueListenable: _isButtonVisible,
          builder: (context, isVisible, child) {
            return isVisible
                ? FloatingActionButton(
                    onPressed: _scrollToTop,
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                  )
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: Text('Home', style: NeededTextstyles.heading1),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('About Me', style: NeededTextstyles.heading1),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AboutmeScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Projects', style: NeededTextstyles.heading1),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProjectScreen()),
                  );
                },
              ),
              ListTile(
                title: Text('Contact', style: NeededTextstyles.heading1),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ContactScreen()),
                  );
                },
              ),
            ],
          ),
        );
  }
}

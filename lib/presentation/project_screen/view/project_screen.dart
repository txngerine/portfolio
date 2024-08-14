// // ignore_for_file: prefer_const_constructors, unused_local_variable, sort_child_properties_last

// import 'package:flutter/material.dart';
// import 'package:portfolio/core/constant/textconstant.dart';
// import 'package:portfolio/globalwidgets/customappbar.dart';
// import 'package:portfolio/globalwidgets/contactcard.dart';

// class ProjectScreen extends StatefulWidget {
//   const ProjectScreen({super.key});

//   @override
//   State<ProjectScreen> createState() => _ProjectScreenState();
// }

// class _ProjectScreenState extends State<ProjectScreen> {
//   final ScrollController _scrollController = ScrollController();
//   final ValueNotifier<bool> _isButtonVisible = ValueNotifier(false);

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       if (_scrollController.offset >= 100) {
//         _isButtonVisible.value = true;
//       } else {
//         _isButtonVisible.value = false;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _isButtonVisible.dispose();
//     super.dispose();
//   }

//   void _scrollToTop() {
//     _scrollController.animateTo(
//       0,
//       duration: Duration(seconds: 1),
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: CustomAppBar(),
//         body: LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints constraints) {
//             double maxWidth = constraints.maxWidth;
//             return SingleChildScrollView(
//               controller: _scrollController,
//               scrollDirection: Axis.vertical,
//               child: Center(
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 700,
//                       child: Center(
//                         child: Text(
//                           "Coming soon...",
//                           style: NeededTextstyles.ultimatemax,
//                         ),
//                       ),
//                     ),
//                     Contactcard(),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//         floatingActionButton: ValueListenableBuilder<bool>(
//           valueListenable: _isButtonVisible,
//           builder: (context, isVisible, child) {
//             return isVisible
//                 ? FloatingActionButton(
//                     onPressed: _scrollToTop,
//                     child: Icon(
//                       Icons.arrow_upward,
//                       color: Colors.white,
//                     ),
//                     backgroundColor: Colors.black,
//                   )
//                 : Container();
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:portfolio/core/constant/textconstant.dart';
// import 'package:portfolio/globalwidgets/customappbar.dart';
// import 'package:portfolio/globalwidgets/contactcard.dart';
// import 'package:portfolio/repository/githubservice.dart';
// import 'package:portfolio/repository/model/githubmodel.dart';
// import 'package:url_launcher/url_launcher.dart';

// import 'projectcard.dart';

// class ProjectScreen extends StatefulWidget {
//   const ProjectScreen({super.key});

//   @override
//   State<ProjectScreen> createState() => _ProjectScreenState();
// }

// class _ProjectScreenState extends State<ProjectScreen> {
//   final ScrollController _scrollController = ScrollController();
//   final ValueNotifier<bool> _isButtonVisible = ValueNotifier(false);
//   late Future<List<GitHubProject>> _projectsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(() {
//       if (_scrollController.offset >= 100) {
//         _isButtonVisible.value = true;
//       } else {
//         _isButtonVisible.value = false;
//       }
//     });

//     _projectsFuture = GitHubService('Nyouibou').fetchProjects();
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _isButtonVisible.dispose();
//     super.dispose();
//   }

//   void _scrollToTop() {
//     _scrollController.animateTo(
//       0,
//       duration: Duration(seconds: 1),
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: CustomAppBar(),
//         body: LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints constraints) {
//             double maxWidth = constraints.maxWidth;
//             return SingleChildScrollView(
//               controller: _scrollController,
//               scrollDirection: Axis.vertical,
//               child: Center(
//                 child: Column(
//                   children: [
//                     // Container(
//                     //   height: 700,
//                     //   child: Center(
//                     //     child: Text(
//                     //       "Coming soon...",
//                     //       style: NeededTextstyles.ultimatemax,
//                     //     ),
//                     //   ),
//                     // ),
//                     FutureBuilder<List<GitHubProject>>(
//   future: _projectsFuture,
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return Center(child: CircularProgressIndicator());
//     } else if (snapshot.hasError) {
//       return Center(child: Text('Error: ${snapshot.error}'));
//     } else if (snapshot.hasData) {
//       final projects = snapshot.data!;
//       return Column(
//         children: projects.map((project) {
//           return ProjectCard(project: project);
//         }).toList(),
//       );
//     } else {
//       return Center(child: Text('No projects found.'));
//     }
//   },
// ),

//                     Contactcard(),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//         floatingActionButton: ValueListenableBuilder<bool>(
//           valueListenable: _isButtonVisible,
//           builder: (context, isVisible, child) {
//             return isVisible
//                 ? FloatingActionButton(
//                     onPressed: _scrollToTop,
//                     child: Icon(
//                       Icons.arrow_upward,
//                       color: Colors.white,
//                     ),
//                     backgroundColor: Colors.black,
//                   )
//                 : Container();
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/globalwidgets/customappbar.dart';
import 'package:portfolio/globalwidgets/contactcard.dart';
import 'package:portfolio/repository/githubservice.dart';
import 'package:portfolio/repository/model/githubmodel.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
// import 'package:dart:math'; // Import dart:math for generating random numbers
import 'dart:math';

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
      if (_scrollController.offset >= 100) {
        _isButtonVisible.value = true;
      } else {
        _isButtonVisible.value = false;
      }
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
      255,
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
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double maxWidth = constraints.maxWidth;
            return SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  children: [
                    FutureBuilder<List<GitHubProject>>(
                      future: _projectsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (snapshot.hasData) {
                          final projects = snapshot.data!;
                          return Column(
                            children: projects.map((project) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Tilt(
                                  tiltConfig: TiltConfig(
                                    angle: 20, // Adjust the tilt angle
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          _generateRandomColor(), // Assign a random color
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ProjectCard(project: project),
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
                : Container();
          },
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/globalwidgets/customappbar.dart';
import 'package:portfolio/globalwidgets/contactcard.dart';
import 'package:portfolio/core/controllers/project_controller.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import '../../../core/constant/textconstant.dart';
import 'projectcard.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  late final ProjectController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ProjectController());
  }

  @override
  void dispose() {
    Get.delete<ProjectController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        endDrawer: _buildDrawer(),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double maxWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;

            return SingleChildScrollView(
              controller: controller.scrollController,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Wrap(
                        spacing: 16.0,
                        runSpacing: 16.0,
                        children: controller.projects.map((project) {
                          return SizedBox(
                            width: min(maxWidth * 0.9, 1400),
                            child: Padding(
                              padding: const EdgeInsets.all(8.5),
                              child: Tilt(
                                tiltConfig: TiltConfig(angle: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: controller.generateRandomColor(),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ProjectCard(project: project),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                    SizedBox(height: screenHeight * 0.1),
                    Contactcard(),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: Obx(() {
          return controller.isButtonVisible.value
              ? FloatingActionButton(
                  onPressed: controller.scrollToTop,
                  child: const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.black,
                )
              : const SizedBox.shrink();
        }),
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
            onTap: () => context.go('/home'),
          ),
          ListTile(
            title: Text('About Me', style: NeededTextstyles.heading1),
            onTap: () => context.go('/about'),
          ),
          ListTile(
            title: Text('Projects', style: NeededTextstyles.heading1),
            onTap: () => context.go('/projects'),
          ),
          ListTile(
            title: Text('Contact', style: NeededTextstyles.heading1),
            onTap: () => context.go('/contact'),
          ),
        ],
      ),
    );
  }
}

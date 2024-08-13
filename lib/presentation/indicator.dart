import 'package:flutter/material.dart';
import 'package:portfolio/presentation/about_me_screen/view/widgets/skillcard.dart';

class DartSkillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of skills and their proficiency levels
    final List<Map<String, dynamic>> skills = [
      {'name': 'Dart', 'level': 0.90},
      {'name': 'Flutter', 'level': 0.85},
      {'name': 'JavaScript', 'level': 0.70},
      {'name': 'Python', 'level': 0.75},
      {'name': 'Java', 'level': 0.65},
    ];

    return Scaffold(
      body: SkillCard(skills: skills),
    );
  }
}

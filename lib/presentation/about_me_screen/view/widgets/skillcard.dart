import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/colorconstants.dart';
import 'package:portfolio/core/constant/textconstant.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.skills,
  });

  final List<Map<String, dynamic>> skills;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: skills.map((skill) {
            double skillLevel =
                skill['level'] as double; // Explicitly cast to double
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill['name'] as String, // Explicitly cast to String
                    style: NeededTextstyles.littletextdark,
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: skillLevel,
                          minHeight: 5.0,
                          backgroundColor: Colors.grey[300],
                          color: Colorconstants.nothingred,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        '${(skillLevel * 100).toInt()}%',
                        style: NeededTextstyles.littletextdark,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

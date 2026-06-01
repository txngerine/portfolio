import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/colorconstants.dart';
import 'package:portfolio/core/constant/textconstant.dart';

class SkillCard2 extends StatelessWidget {
  const SkillCard2({
    super.key,
    required this.skills2,
  });

  final List<Map<String, dynamic>> skills2;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth =
            constraints.maxWidth < 500 ? constraints.maxWidth : 400;

        return SizedBox(
          width: cardWidth,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: skills2.map((skill) {
                double skillLevel = skill['level'] as double;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        skill['name'] as String,
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
      },
    );
  }
}

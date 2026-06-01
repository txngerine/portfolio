import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:url_launcher/url_launcher.dart';

class Contactcard extends StatelessWidget {
  const Contactcard({super.key});

  void _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmall = constraints.maxWidth < 600;

          if (isSmall) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Let's connect",
                  style: NeededTextstyles.ultimatemax.copyWith(fontSize: 36),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "digitally",
                  style: NeededTextstyles.ultimatemax.copyWith(fontSize: 36),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                _buildLinks(context, isSmall),
                const SizedBox(height: 40),
                Text(
                  "© 2026 AKSHAY TS",
                  style: NeededTextstyles.littletext.copyWith(fontSize: 12),
                ),
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's connect",
                      style: NeededTextstyles.ultimatemax,
                    ),
                    Text(
                      "digitally",
                      style: NeededTextstyles.ultimatemax,
                    ),
                    const SizedBox(height: 60),
                    Text(
                      "© 2026 AKSHAY TS",
                      style: NeededTextstyles.littletext,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                flex: 1,
                child: _buildLinks(context, isSmall),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLinks(BuildContext context, bool isSmall) {
    final links = [
      ('Email', 'mailto:${AppConstants.email}'),
      ('Instagram', 'https://instagram.com/akshaiiii.i'),
      ('Twitter', 'https://twitter.com/yourusername'),
      ('Github', 'https://github.com/${AppConstants.githubUsername}'),
      ('LinkedIn', 'https://linkedin.com/in/akshai-t-s'),
    ];

    return Column(
      crossAxisAlignment:
          isSmall ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: links.map((link) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: InkWell(
            onTap: () => _launchURL(link.$2),
            child: Text(
              link.$1,
              style: NeededTextstyles.contactsname
                  .copyWith(fontSize: isSmall ? 20 : 36),
            ),
          ),
        );
      }).toList(),
    );
  }
}

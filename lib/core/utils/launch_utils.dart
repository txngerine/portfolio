import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  }
}

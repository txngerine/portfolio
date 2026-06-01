import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/repository/model/githubmodel.dart';

class GitHubService {
  Future<List<GitHubProject>> fetchProjects() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.github.com/users/${AppConstants.githubUsername}/repos'),
      );

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => GitHubProject.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load projects (status: ${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Failed to load projects: $e');
    }
  }
}

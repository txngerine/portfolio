// lib/services/github_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/repository/model/githubmodel.dart';

class GitHubService {
  final String username;

  GitHubService(this.username);

  Future<List<GitHubProject>> fetchProjects() async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users/nyouibou/repos'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => GitHubProject.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load projects');
    }
  }
}

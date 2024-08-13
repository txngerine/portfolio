// lib/models/github_project.dart
class GitHubProject {
  final String name;
  final String description;
  final String htmlUrl;

  GitHubProject({
    required this.name,
    required this.description,
    required this.htmlUrl,
  });

  factory GitHubProject.fromJson(Map<String, dynamic> json) {
    return GitHubProject(
      name: json['name'],
      description: json['description'] ?? 'No description',
      htmlUrl: json['html_url'],
    );
  }
}

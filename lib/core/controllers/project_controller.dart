import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/repository/githubservice.dart';
import 'package:portfolio/repository/model/githubmodel.dart';

class ProjectController extends GetxController {
  final GitHubService _gitHubService = GitHubService();

  final projects = <GitHubProject>[].obs;
  final isLoading = true.obs;
  final isButtonVisible = false.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      isButtonVisible.value = scrollController.offset >= 100;
    });
    fetchProjects();
  }

  void fetchProjects() async {
    try {
      isLoading(true);
      final result = await _gitHubService.fetchProjects();
      projects.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', 'Failed to load projects: $e');
    } finally {
      isLoading(false);
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Color generateRandomColor() {
    final random = Random();
    return Color.fromARGB(
      102,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

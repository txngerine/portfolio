import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/core/utils/launch_utils.dart';

class ContactController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  void submitForm() {
    if (formKey.currentState!.validate()) {
      final name = Uri.encodeComponent(nameController.text);
      final email = Uri.encodeComponent(emailController.text);
      final message = Uri.encodeComponent(messageController.text);
      final mailtoUrl =
          'mailto:${AppConstants.email}?subject=Portfolio Contact from $name&body=$message%0A%0AFrom: $name ($email)';
      launchURL(mailtoUrl);
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }
}

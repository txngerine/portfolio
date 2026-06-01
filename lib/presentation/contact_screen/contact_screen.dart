import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/core/controllers/contact_controller.dart';
import 'package:portfolio/globalwidgets/customappbar.dart';
import 'package:portfolio/globalwidgets/contactcard.dart';
import 'package:portfolio/globalwidgets/animations/fade_in_slide.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late final ContactController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(ContactController());
  }

  @override
  void dispose() {
    Get.delete<ContactController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                child: Text('Menu', style: NeededTextstyles.heading1),
              ),
              ListTile(
                title: Text('Home', style: NeededTextstyles.heading1),
                onTap: () => context.go('/home'),
              ),
              ListTile(
                title: Text('About Me', style: NeededTextstyles.heading1),
                onTap: () => context.go('/about'),
              ),
              ListTile(
                title: Text('Projects', style: NeededTextstyles.heading1),
                onTap: () => context.go('/projects'),
              ),
              ListTile(
                title: Text('Contact', style: NeededTextstyles.heading1),
                onTap: () => context.go('/contact'),
              ),
            ],
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double maxWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;

            return SingleChildScrollView(
              controller: controller.scrollController,
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    FadeInSlide(
                      delay: Duration(milliseconds: 200),
                      child: Text(
                        "Get in touch",
                        style: NeededTextstyles.ultimatemax,
                      ),
                    ),
                    SizedBox(height: 40),
                    FadeInSlide(
                      delay: Duration(milliseconds: 400),
                      beginOffset: Offset(0, 40),
                      child: SizedBox(
                        height: screenHeight * 0.7,
                        width: min(maxWidth * 0.9, 1000),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "What is your name?",
                                style: NeededTextstyles.questionheading1,
                              ),
                              TextFormField(
                                controller: controller.nameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'Enter your name here',
                                ),
                                validator: (v) =>
                                    v == null || v.isEmpty ? 'Required' : null,
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Text(
                                "What is your email address?",
                                style: NeededTextstyles.questionheading1,
                              ),
                              TextFormField(
                                controller: controller.emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(),
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: 'name@website.com',
                                ),
                                validator: (v) {
                                  if (v == null || v.isEmpty) return 'Required';
                                  if (!v.contains('@')) return 'Invalid email';
                                  return null;
                                },
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Text(
                                "Your message",
                                style: NeededTextstyles.questionheading1,
                              ),
                              TextFormField(
                                controller: controller.messageController,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'How can I help you',
                                ),
                                validator: (v) =>
                                    v == null || v.isEmpty ? 'Required' : null,
                              ),
                              SizedBox(height: screenHeight * 0.03),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: controller.submitForm,
                                    child: Container(
                                      decoration:
                                          BoxDecoration(color: Colors.black),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          "Send Message",
                                          style: NeededTextstyles.ultimatex2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.1),
                    FadeInSlide(
                      delay: Duration(milliseconds: 300),
                      beginOffset: Offset(0, 50),
                      child: Contactcard(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

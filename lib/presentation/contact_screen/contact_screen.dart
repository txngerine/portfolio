import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/globalwidgets/customappbar.dart';
import 'package:portfolio/globalwidgets/contactcard.dart';
import 'package:portfolio/globalwidgets/animations/fade_in_slide.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _scrollController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = Uri.encodeComponent(_nameController.text);
      final email = Uri.encodeComponent(_emailController.text);
      final message = Uri.encodeComponent(_messageController.text);
      final mailtoUrl =
          'mailto:${AppConstants.email}?subject=Portfolio Contact from $name&body=$message%0A%0AFrom: $name ($email)';
      _launchURL(mailtoUrl);
    }
  }

  void _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
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
              controller: _scrollController,
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
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "What is your name?",
                                style: NeededTextstyles.questionheading1,
                              ),
                              TextFormField(
                                controller: _nameController,
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
                                controller: _emailController,
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
                                controller: _messageController,
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
                                    onTap: _submitForm,
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

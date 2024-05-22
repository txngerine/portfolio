// ignore_for_file: prefer_const_constructors, unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/globalwidgets/customappbar.dart';
import 'package:portfolio/globalwidgets/contactcard.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _isButtonVisible = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 100) {
        _isButtonVisible.value = true;
      } else {
        _isButtonVisible.value = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isButtonVisible.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double maxWidth = constraints.maxWidth;
            return SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text(
                      "Get in touch",
                      style: NeededTextstyles.ultimatemax,
                    ),
                    SizedBox(
                      height: 600,
                      width: 1000,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "What is your name?",
                            style: NeededTextstyles.questionheading1,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Enter your name here',
                            ),
                          ),
                          Text(
                            "What is your email address?",
                            style: NeededTextstyles.questionheading1,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'E g: name@website.com',
                            ),
                          ),
                          Text(
                            "Your message",
                            style: NeededTextstyles.questionheading1,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 60.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'How can I help you',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(color: Colors.black),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    "Send Message",
                                    style: NeededTextstyles.ultimatex2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Contactcard(),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: ValueListenableBuilder<bool>(
          valueListenable: _isButtonVisible,
          builder: (context, isVisible, child) {
            return isVisible
                ? FloatingActionButton(
                    onPressed: _scrollToTop,
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.black,
                  )
                : Container();
          },
        ),
      ),
    );
  }
}

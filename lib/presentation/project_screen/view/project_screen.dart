// ignore_for_file: prefer_const_constructors, unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/globalwidgets/customappbar.dart';
import 'package:portfolio/globalwidgets/contactcard.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
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
                    Container(
                      height: 700,
                      child: Center(
                        child: Text(
                          "Comming soon...",
                          style: NeededTextstyles.ultimatemax,
                        ),
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/constant/textconstant.dart';

class CustomAppBarD extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return AppBar(
            backgroundColor: Colors.black,
            title: Text("Akshay T S", style: NeededTextstyles.heading1da),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ],
          );
        } else {
          return AppBar(
            backgroundColor: Colors.black,
            title: Text("Akshay T S", style: NeededTextstyles.heading1da),
            actions: [
              TextButton(
                onPressed: () => context.go('/home'),
                child: Text("Home", style: NeededTextstyles.Subheading1da),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () => context.go('/about'),
                child: Text("About Me", style: NeededTextstyles.Subheading1da),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () => context.go('/projects'),
                child: Text("Projects", style: NeededTextstyles.Subheading1da),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () => context.go('/contact'),
                child: Text("Contact", style: NeededTextstyles.Subheading1da),
              ),
              SizedBox(width: 10),
            ],
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

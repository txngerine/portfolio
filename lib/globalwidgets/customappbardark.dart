// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:portfolio/core/constant/textconstant.dart';
// import 'package:portfolio/presentation/about_me_screen/aboutme_screen.dart';
// import 'package:portfolio/presentation/contact_screen/contact_screen.dart';
// import 'package:portfolio/presentation/homescreen/view/home_screen.dart';
// import 'package:portfolio/presentation/project_screen/view/project_screen.dart';

// class CustomAppBarDark extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBarDark({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.transparent,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Akshay T S",
//               style: NeededTextstyles.heading1da,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => HomeScreen(),
//                         ));
//                   },
//                   child: Text(
//                     "Home",
//                     style: NeededTextstyles.Subheading1da,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AboutmeScreen(),
//                         ));
//                   },
//                   child: Text(
//                     "About Me",
//                     style: NeededTextstyles.Subheading1da,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ProjectScreen(),
//                         ));
//                   },
//                   child: Text(
//                     "Projects",
//                     style: NeededTextstyles.Subheading1da,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ContactScreen(),
//                         ));
//                   },
//                   child: Text(
//                     "Contact",
//                     style: NeededTextstyles.Subheading1da,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }
import 'package:flutter/material.dart';
import 'package:portfolio/core/constant/textconstant.dart';
import 'package:portfolio/presentation/about_me_screen/aboutme_screen.dart';
import 'package:portfolio/presentation/contact_screen/contact_screen.dart';
import 'package:portfolio/presentation/homescreen/view/home_screen.dart';
import 'package:portfolio/presentation/project_screen/view/project_screen.dart';

// class CustomAppBarDark extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBarDark({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isMobile = MediaQuery.of(context).size.width < 800;

//     return isMobile
//         ? AppBar(
//             backgroundColor: Colors.black,
//             title: Text(
//               "Akshay T S",
//               style: NeededTextstyles.heading1da,
//             ),
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.menu),
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//               ),
//             ],
//           )
//         : Container(
//             color: Colors.black,
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Akshay T S",
//                     style: NeededTextstyles.heading1da,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       _buildNavButton(context, "Home", HomeScreen()),
//                       SizedBox(width: 10),
//                       _buildNavButton(context, "About Me", AboutmeScreen()),
//                       SizedBox(width: 10),
//                       _buildNavButton(context, "Projects", ProjectScreen()),
//                       SizedBox(width: 10),
//                       _buildNavButton(context, "Contact", ContactScreen()),
//                       SizedBox(width: 10),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//   }

//   Widget _buildNavButton(BuildContext context, String label, Widget screen) {
//     return Semantics(
//       label: label,
//       child: InkWell(
//         onTap: () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => screen,
//             ),
//           );
//         },
//         child: Text(
//           label,
//           style: NeededTextstyles.Subheading1da,
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }

class CustomAppBarD extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile layout with EndDrawer
          return AppBar(
            backgroundColor: Colors.black, // Set background color to black
            title: Text("Akshay T S", style: NeededTextstyles.heading1da),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context)
                        .openEndDrawer(); // Use openEndDrawer for endDrawer
                  },
                ),
              ),
            ],
          );
        } else {
          // Desktop layout with regular AppBar
          return AppBar(
            backgroundColor: Colors.black, // Set background color to black
            title: Text("Akshay T S", style: NeededTextstyles.heading1da),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text("Home", style: NeededTextstyles.Subheading1da),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AboutmeScreen()),
                  );
                },
                child: Text("About Me", style: NeededTextstyles.Subheading1da),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProjectScreen()),
                  );
                },
                child: Text("Projects", style: NeededTextstyles.Subheading1da),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ContactScreen()),
                  );
                },
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

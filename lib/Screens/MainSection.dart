import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:websitetest/Screens/AbousUsScreen.dart';
import 'package:websitetest/Screens/HomeScreen.dart';
import 'package:websitetest/Screens/ProjectsScreen.dart';
import 'package:websitetest/Screens/ServicesScreen.dart';
import 'package:websitetest/Screens/contactScreen.dart';

import '../kconstnt/constants.dart';

class MainSection extends StatefulWidget {
  MainSection({super.key});

  @override
  _MainSectionState createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  final Color1 = Colors.white;
  int colornum=0;
 final   Color2=Colors.cyan;
  final List<Widget> screens = [
    Homescreen(),
    Aboususscreen(),
    Servicesscreen(),
    Projectsscreen(),
    Contactscreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff002C5B), // Using custom color
        title: _buildNavBar(context),
        centerTitle: true,
      ),
      body: screens[index],
    );
  }

  // Navigation Bar Widget
  Widget _buildNavBar(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.message, color: Colors.white, size: 30),
          SizedBox(width: 10),
          Text(
            "cs@egy-builders.com",
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
          ),
          SizedBox(width: 20),
          Icon(Icons.phone, color: Colors.white, size: 30),
          SizedBox(width: 8),
          Text(
            "15779",
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
          ),
          SizedBox(width: 40),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colornum == 0
                    ? [Colors.red, Colors.red] // Single color or gradient from the same color
                    : [
                  Colors.blueAccent,
                  Colors.blueAccent
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 5,
                  offset: Offset(0, 10),
                ),
              ],
            ),

            child: TextButton(
              onPressed: () {
                setState(() {
                  index = 0;
                  colornum=0;
                });
              },
              child: Text(
                'Home',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 20),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colornum == 1
                    ? [Colors.red, Colors.red] // Single color or gradient from the same color
                    : [
                  Colors.blueAccent,
                  Colors.blueAccent
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 5,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  index = 1;
                  colornum=1;
                });
              },
              child: Text(
                'About Us',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 20),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colornum == 2
                    ? [Colors.red, Colors.red] // Single color or gradient from the same color
                    : [
                  Colors.blueAccent,
                  Colors.blueAccent
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 5,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  index = 2;
                  colornum=2;
                });
              },
              child: Text(
                'Services',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 20),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colornum == 3
                    ? [Colors.red, Colors.red] // Single color or gradient from the same color
                    : [
                  Colors.blueAccent,
                  Colors.blueAccent
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 5,
                  offset: Offset(0, 10),
                ),
              ],
            ),

            child: TextButton(
              onPressed: () {
                setState(() {
                  index = 3;
                  colornum=3;
                });
              },
              child: Text(
                'Projects',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 20),

          Container(

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colornum == 4
                    ? [Colors.red, Colors.red] // Single color or gradient from the same color
                    : [
                  Colors.blueAccent,
                  Colors.blueAccent
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 5,
                  offset: Offset(0, 10),
                ),
              ],
            ),
          //  color:colornum==4 ?Colors.red :null,


            child: TextButton(
              onPressed: () {
                setState(() {
                  colornum=4;
                  index = 4;
                });
              },
              child: Text(
                'Contact',
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 40),

          Icon(Icons.facebook, color: Colors.white, size: 30),
          SizedBox(width: 8),
          Icon(Icons.animation, color: Colors.white, size: 30),
          SizedBox(width: 8),
          Icon(Icons.youtube_searched_for, color: Colors.white, size: 30),
          SizedBox(width: 8),
          Icon(Icons.link, color: Colors.white, size: 30),
          SizedBox(width: 20),

          Container(
            color: kPrimaryColor,
            padding: EdgeInsets.all(8),
            child: Text(
              "Visit us",
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

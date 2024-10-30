import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;


class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  // Function to launch URL

  void _launchURL(String url) {
    html.window.open(url, '_blank');
  }

  final List<Item> data = [
    Item(
        image:
        'https://i.pinimg.com/originals/e9/b0/3a/e9b03a701ce2c6ddb50a944d1f281762.jpg'),
    Item(
        image:
        'https://img.pikbest.com/origin/06/02/31/97YpIkbEsT93a.jpg!f305cw'),
    Item(
        image:
        'https://th.bing.com/th/id/OIP.jVgo7pWR96TWa97GKd_f5wHaHa?w=1400&h=1400&rs=1&pid=ImgDetMain'),
  ];

  final List<Item> projects = [
    Item(
        image:
        'https://media.bizj.us/view/img/12395388/010-2153632021001*900xx1600-899-0-0.jpg'),
    Item(
        image:
        'https://media.bizj.us/view/img/10863738/333johncarlyle*900xx1229-691-0-105.jpg'),
    Item(
        image:
        'https://images1.apartments.com/i2/93lVe8xYYeAGNEHmAAx4yKINpyZ_S8yTHCAfkTqDLIs/111/the-bishop-atlanta-ga-primary-photo.jpg'),
    Item(
        image:
        'https://applehospitalityreit.com/wp-content/uploads/2022/05/alfPWMALex-1070147-Exterior-High-web-scaled.jpg'),
    Item(
        image:
        'https://vancebrown.com/wp-content/uploads/2015/12/Vance_Brown_Crossing900_Office_Thumbnail_2.jpg'),
  ];

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )
      ..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              children: [
          AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: CarouselSlider(
            key: ValueKey<int>(DateTime
                .now()
                .millisecondsSinceEpoch),
            items: data.map((item) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(item.image!,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: progress.expectedTotalBytes != null
                                ? progress.cumulativeBytesLoaded /
                                (progress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset("assets/images/project-02.jpg")),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 650,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blueAccent, Colors.purpleAccent],
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/project-01.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About Us",
                          style: GoogleFonts.roboto(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "GET CLOSER TO EBD\n\n"
                              "Since its inception, Egypt Builders Developments – EBD has involved a wide range of contracting projects, including industrial, commercial, and residential projects. EBD has set exceptional building and finishing standards in the real estate sector, enabling successful partnerships.\n\n"
                              "Moreover, resourcing all construction and architectural requirements is believed to be one of the important competitive advantages in the company, which acquired a portfolio greater than 150,000 m².",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Hotline: 15779\nEmail: cs@egy-builders.com",
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/project-03.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black54,
                  BlendMode.darken,
                ),
              ),
              gradient: const LinearGradient(
                colors: [Colors.lightBlue, Colors.deepPurpleAccent],
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
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Our Services",
                    style: GoogleFonts.roboto(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "WHAT WE OFFER TO OUR CLIENTS?",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/project-04.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "We offer our clients a wide range of services in the construction field, where these services meet all the requirements of the real estate market, with high efficiency and accuracy, through our experienced and specialized team.",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Colors.white,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: 20),
                              _buildServiceItem(
                                "Construction Services",
                                "We have our experienced staff as well as our professional equipment needed for any project.",
                              ),
                              _buildServiceItem(
                                "Construction Equipment",
                                "We have all the powerful and professional equipment needed for your next project.",
                              ),
                              _buildServiceItem(
                                "Architectural Finishing",
                                "We offer a high quality and complete architectural finishing to our clients.",
                              ),
                              _buildServiceItem(
                                "Public Utility Works",
                                "EBD provides its clients with a plenty of services related to the Public Utility.",
                              ),
                            ],
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
        SizedBox(height: 40),
        FadeTransition(
          opacity: _animation,
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Our Projects",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Learn About Our Projects",
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        CarouselSlider(
          items: projects.map((item) {
            return Container(
              width: 700,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(item.image!,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: progress.expectedTotalBytes != null
                              ? progress.cumulativeBytesLoaded /
                              (progress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset("assets/images/project-02.jpg")),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 400,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(height: 40),
        Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Contact Us",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title Section
                  Text(
                    "Our Head Office",
                    style: GoogleFonts.roboto(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Static Map Image
                  InkWell(
                    onTap: () {
                      _launchURL(
                          "https://www.google.com/maps/place/Egypt+Builders+Developments/@29.995868,31.420136,19z/data=!4m6!3m5!1s0x14583d441b545c37:0x1689d6784abf3f60!8m2!3d29.9963302!4d31.4192008!16s%2Fg%2F11f9xdwq3j?hl=en&entry=ttu&g_ep=EgoyMDI0MDkxMS4wIKXMDSoASAFQAw%3D%3D");
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/Screenshot (75).png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.error,
                                size: 50, color: Colors.red),
                      ),
                    ),
                  ),

                  // Office Address Section
                  const SizedBox(height: 20),
                  Text(
                    "Address: Egypt Builders Developments\n29.995868, 31.420136",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 40,),
                Container(
                  color: Color(0xff002C5B),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Get In Touch Section
                      Text(
                        'Get In Touch',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '120 Mohamed Farid Axis, Fifth Settlement, Cairo',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        'cs@egy-builders.com',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Useful Links and Recent News Sections Side by Side
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Useful Links Section
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Useful Links',
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        // Navigate to Home
                                      },
                                      child: Text(
                                        'Home',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Navigate to About Us
                                      },
                                      child: Text(
                                        'About Us',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Navigate to Services
                                      },
                                      child: Text(
                                        'Services',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Navigate to Projects
                                      },
                                      child: Text(
                                        'Projects',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Navigate to News
                                      },
                                      child: Text(
                                        'News',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Navigate to Contact Us
                                      },
                                      child: Text(
                                        'Contact Us',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20), // Space between sections

                          // Recent News Section
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Recent News',
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'EBD To Launch XS79 Mall',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  'September 18, 2021',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      // Call Us Section
                      Text(
                        'Call Us',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '15779',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Copyright Section
                      Text(
                        'Copyright © 2024 Egypt Builders Developments All rights reserved.',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                )
            ],
      ),
    ),)
    ,
    );
  }

  Widget _buildServiceItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

// Sample Item class
class Item {
  final String? image;

  Item({this.image});
}

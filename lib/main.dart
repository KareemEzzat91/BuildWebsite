import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:websitetest/Screens/MainSection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'kconstnt/constants.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Estate',
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        canvasColor: kBgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white)
            .copyWith(
          bodyLarge: TextStyle(color: kBodyTextColor),
          bodyMedium: TextStyle(color: kBodyTextColor),
        ),
      ),
      home: MainSection(),
    );
  }
}
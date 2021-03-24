import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: GoogleFonts.manrope().fontFamily,
      ),
      routes: routes,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/home_page.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  final TextStyle _baseTextStyle = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          backgroundColor: Colors.white,
        ).copyWith(
          secondary: Colors.white,
          shadow: Colors.deepPurple[300],
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.inter(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            textStyle: _baseTextStyle,
          ),
          titleLarge: GoogleFonts.inter(
            fontSize: 20,
            textStyle: _baseTextStyle,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.inter(
            textStyle: _baseTextStyle,
          ),
          bodySmall: GoogleFonts.inter(
            textStyle: _baseTextStyle,
          ),
          displaySmall: GoogleFonts.inter(
            textStyle: _baseTextStyle,
          ),
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';

class AppTexts {
  AppTexts._();

// Heading
  static TextStyle largeHeading = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 32,
  );

  static TextStyle meduimHeading = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static TextStyle smallHeading = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

// body

  static TextStyle regularBody = TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );

  static TextStyle meduimBody = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle smallBody = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );
  static TextStyle verySmallBody = TextStyle(
    fontSize: 12,
    color: Colors.black,
  );
}

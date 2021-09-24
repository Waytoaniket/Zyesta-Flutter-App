import 'package:flutter/material.dart';

final backgroundTheme = Container(
  height: double.infinity,
  width: double.infinity,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF71A6FD).withOpacity(0.4),
        Color(0xFF94A0F9).withOpacity(0.4),
        Color(0xFFC997F2).withOpacity(0.4),
        Color(0xFFD695F1).withOpacity(0.4),
      ],
      stops: [0.1, 0.4, 0.7, 0.9],
    ),
  ),
);
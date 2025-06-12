import 'package:flutter/material.dart';

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top-left
    path.lineTo(0, size.height * 1.1); // Deep dip at bottom-left

    // Smooth wave up to the right side
    path.quadraticBezierTo(
      size.width * 0,
      size.height * 0.52, // control point (pulls wave up)
      size.width * 0.77,
      size.height * 0.9, // mid wave
    );
    path.quadraticBezierTo(
      size.width * 1.0,
      size.height * 0.9, // gentle down near right
      size.width,
      size.height * 0.8, // slight rise at far right
    );

    // Top-right corner
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

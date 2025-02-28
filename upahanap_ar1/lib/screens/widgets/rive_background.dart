import 'dart:ui'; // Required for ImageFilter.blur
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveBackground extends StatelessWidget {
  const RiveBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // White background
        Container(
          color: const Color.fromARGB(245, 245, 245, 245),
        ),

        // Rive animation with blur effect
        Positioned.fill(
          child: Stack(
            children: [
              const RiveAnimation.asset(
                'assets/3_body_background (1).riv',
                fit: BoxFit.cover,
              ),

              // Blur effect applied over the animation
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
                  child: Container(
                    color:
                        Colors.transparent, // Transparent layer to apply blur
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

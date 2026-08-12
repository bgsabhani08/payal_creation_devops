import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF3E2723),
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),

      child: Column(
        children: [

          const Text(
            "Payal Creation",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "Handcrafted Memories for Every Beautiful Occasion",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 25),

          Container(
            height: 1,
            color: Colors.white24,
          ),

          const SizedBox(height: 20),

          Text(
            "Made with ❤️ by Payal Creation",
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "© 2026 All Rights Reserved",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
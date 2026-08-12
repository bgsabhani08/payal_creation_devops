import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 60,
      ),
      color: Colors.white,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              "https://images.unsplash.com/photo-1519741497674-611481863552?q=80&w=1200",
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            "Handcrafted with love",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3E2723)
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Every creation at Payal Creation is thoughtfully designed and hand-painted to celebrate life's most special moments.\n\nFrom traditional wedding antarpat designs and personalized bridal accessories to baby shower outfits and keepsake frames, each piece is created with attention to detail and a touch of artistry.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 1.8,
              color: Colors.black87,
            )
          ),

          SizedBox(height: 20),

          const Text(
            "Made with love in India ❤️",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
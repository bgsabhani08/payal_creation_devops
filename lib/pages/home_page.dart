import 'package:flutter/material.dart';
import 'package:payal_creation/widgets/about_section.dart';
import 'package:payal_creation/widgets/contact_section.dart';
import 'package:payal_creation/widgets/featured_section.dart';
import 'package:payal_creation/widgets/footer_section.dart';
import 'package:payal_creation/widgets/hero_section.dart';
import 'package:url_launcher/url_launcher.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
        onPressed: () async {
        
          final Uri url = Uri.parse(
            "https://wa.me/9081377465?text=Hi, I'm interested in your creations.",
          );
          await launchUrl(
            url,
            mode: LaunchMode.externalApplication,
          );
        },
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),      
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            const FeaturedSection(),
            const AboutSection(),
            const ContactSection(),
            const FooterSection()
          ],
        ),
      ),
    );
  }
}
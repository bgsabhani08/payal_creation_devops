import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF7EFE5),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 40,
      ),
      child: Column(
        children: [
          const Text(
            "Let's Create Something Beautiful Together",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3E2723),
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "For wedding, baby shower and customized handmade creations.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 35),

          ListTile(
            leading: const Icon(Icons.call, color: Colors.brown),
            title: const Text("Call"),
            subtitle: const Text("+91 90813 77465"),
            onTap: () {
              _launchUrl("tel:+919081377465");
            },
          ),

          ListTile(
            leading: const Icon(Icons.chat, color: Colors.green),
            title: const Text("WhatsApp"),
            subtitle: const Text("Chat with us"),
            onTap: () {
              _launchUrl(
                "https://wa.me/919081377465?text=Hi, I'm interested in your creations.",
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.camera_alt, color: Colors.pink),
            title: const Text("Instagram"),
            subtitle: const Text("@payal_creation07"),
            onTap: () {
              _launchUrl(
                "https://www.instagram.com/payal_creation07/",
              );
            },
          ),
        ],
      ),
    );
  }
}
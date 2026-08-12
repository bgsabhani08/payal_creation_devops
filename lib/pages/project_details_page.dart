import 'package:flutter/material.dart';
import 'package:payal_creation/pages/full_secreen_gallery_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project_model.dart';

class ProjectDetailsPage extends StatelessWidget {

  final ProjectModel project;

  const ProjectDetailsPage({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> openWhatsApp() async{

      const phone = "9081377465";

      final message = "Hi, I'm interested in ${project.title}";

      final url = Uri.parse("https://wa.me/$phone?text=${Uri.encodeComponent(message)}");

      if (await canLaunchUrl(url)){
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    }
    return Scaffold(

      backgroundColor: const Color(0xFFFFF8F0),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              // HERO IMAGE
              Stack(
                children: [

                  SizedBox(
                    height: 420,
                    width: double.infinity,

                    child: Image.network(
                      project.coverImage,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 20,
                    left: 20,

                    child: GestureDetector(

                      onTap: () {
                        Navigator.pop(context);
                      },

                      child: Container(

                        padding:
                            const EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color:
                              Colors.black.withOpacity(
                            0.4,
                          ),

                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(

                padding: const EdgeInsets.all(24),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    // TITLE
                    Text(
                      project.title,

                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3E2723),
                        height: 1.2,
                      ),
                    ),

                    const SizedBox(height: 18),

                    // PRICE
                    Text(
                      "₹${project.price.toInt()}",

                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // DESCRIPTION
                    Text(
                      project.description,

                      style: const TextStyle(
                        fontSize: 17,
                        height: 1.8,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // GALLERY TITLE
                    const Text(
                      "Gallery",

                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3E2723),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // GALLERY
                    SizedBox(

                      height: 130,

                      child: ListView.separated(

                        scrollDirection:
                            Axis.horizontal,

                        itemCount:
                            project.images.length,

                        separatorBuilder: (_, __) =>
                            const SizedBox(
                          width: 14,
                        ),

                        itemBuilder: (context, index) {

                          final image =
                              project.images[index];

                          return ClipRRect(

                            borderRadius:
                                BorderRadius.circular(
                              18,
                            ),

                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => FullscreenGalleryPage(images: project.images, initialIndex: index)));
                              },
                              child: Image.network(
                                image,
                              
                                width: 130,
                                height: 130,
                              
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 50),

                    // WHATSAPP BUTTON
                    SizedBox(

                      width: double.infinity,

                      child: ElevatedButton(

                        style:
                            ElevatedButton.styleFrom(

                          backgroundColor:
                              const Color(0xFF25D366),

                          padding:
                              const EdgeInsets.symmetric(
                            vertical: 18,
                          ),

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                              18,
                            ),
                          ),
                        ),

                        onPressed: openWhatsApp,

                        child: const Text(
                          "Inquire on WhatsApp",

                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
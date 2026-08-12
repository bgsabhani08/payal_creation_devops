import 'package:flutter/material.dart';
import 'package:payal_creation/pages/project_details_page.dart';

import '../models/project_model.dart';
import '../services/project_service.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {

    final ProjectService projectService =
        ProjectService();

    return Container(

      color: const Color(0xFFFFF8F0),

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 60,
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          const Text(
            "Featured Creations",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3E2723),
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Crafted for weddings, baby showers and unforgettable memories.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 35),

          StreamBuilder<List<ProjectModel>>(

            stream:
                projectService
                    .getFeaturedProjects(),

            builder: (context, snapshot) {

              if (snapshot.connectionState ==
                  ConnectionState.waiting) {

                return const Center(
                  child:
                      CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {

                return const Text(
                  "Something went wrong",
                );
              }

              final projects =
                  snapshot.data ?? [];

              if (projects.isEmpty) {

                return const Text(
                  "No featured projects yet",
                );
              }

              return SizedBox(

                height: 380,

                child: ListView.separated(

                  scrollDirection:
                      Axis.horizontal,

                  itemCount: projects.length,

                  separatorBuilder: (_, __) =>
                      const SizedBox(width: 20),

                  itemBuilder: (context, index) {

                    final project =
                        projects[index];

                    return CreationCard(
                      project: project,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CreationCard extends StatelessWidget {

  final ProjectModel project;

  const CreationCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => ProjectDetailsPage(project: project)));
      },
      child: SizedBox(
      
        width: 280,
      
        child: Container(
      
          decoration: BoxDecoration(
      
            borderRadius:
                BorderRadius.circular(28),
      
            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.08),
      
                blurRadius: 15,
      
                offset: const Offset(0, 8),
              ),
            ],
          ),
      
          child: ClipRRect(
      
            borderRadius:
                BorderRadius.circular(28),
      
            child: Stack(
              children: [
      
                Positioned.fill(
                  child: Image.network(
                    project.coverImage,
                    fit: BoxFit.cover,
                  ),
                ),
      
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin:
                            Alignment.topCenter,
      
                        end:
                            Alignment.bottomCenter,
      
                        colors: [
                          Colors.transparent,
      
                          Colors.black.withOpacity(
                            0.75,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
      
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 25,
      
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
      
                    children: [
      
                      Text(
                        project.title,
      
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight:
                              FontWeight.w600,
      
                          height: 1.3,
                        ),
                      ),
      
                      const SizedBox(height: 8),
      
                      Text(
                        "₹${project.price.toInt()}",
      
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),

                      const Row(
                        children: [
                          Text(
                            "View Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
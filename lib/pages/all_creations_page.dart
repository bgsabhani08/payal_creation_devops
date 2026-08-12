import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../services/project_service.dart';
import 'project_details_page.dart';

class AllCreationsPage extends StatelessWidget {
  const AllCreationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final projectService = ProjectService();

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F0),

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F0),
        centerTitle: true,
        title: const Text(
          "All Creations",
          style: TextStyle(
            color: Color(0xFF3E2723),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: StreamBuilder<List<ProjectModel>>(
        stream: projectService.getAllProjects(),

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {

            return const Center(
              child: Text("Something went wrong"),
            );
          }

          final projects = snapshot.data ?? [];

          if (projects.isEmpty) {

            return const Center(
              child: Text("No creations yet"),
            );
          }

          return GridView.builder(

            padding: const EdgeInsets.all(20),

            itemCount: projects.length,

            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.72,
            ),

            itemBuilder: (context, index) {

              final project = projects[index];

              return GestureDetector(

                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProjectDetailsPage(
                        project: project,
                      ),
                    ),
                  );
                },

                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(20),

                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),

                          child: Image.network(
                            project.coverImage,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Padding(
                        padding:
                            const EdgeInsets.all(12),

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            Text(
                              project.title,

                              maxLines: 2,

                              overflow:
                                  TextOverflow.ellipsis,

                              style: const TextStyle(
                                fontWeight:
                                    FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "₹${project.price.toInt()}",
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
class ProjectModel {

  final String id;
  final String title;
  final String description;
  final double price;

  final String coverImage;

  final List<dynamic> images;

  final bool isFeatured;

  ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.coverImage,
    required this.images,
    required this.isFeatured,
  });

  factory ProjectModel.fromFirestore(
    Map<String, dynamic> data,
    String id,
  ) {

    return ProjectModel(

      id: id,

      title: data['title'] ?? '',

      description:
          data['description'] ?? '',

      price:
          (data['price'] ?? 0).toDouble(),

      coverImage:
          data['coverImage'] ?? '',

      images:
          data['images'] ?? [],

      isFeatured:
          data['isFeatured'] ?? false,
    );
  }
}
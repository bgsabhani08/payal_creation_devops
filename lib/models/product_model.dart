class ProjectModel {
  final String id;
  final String coverImage;
  final String title;
  final double price;
  final List images;

  ProjectModel({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.images,
    required this.price,
  });

  factory ProjectModel.fromFirestore(Map<String,dynamic> data, String id){
    return ProjectModel(
      id: id,
      title: data['title'] ?? '',
      coverImage: data['coverImage'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      images: data['images'] ?? [],
    );
  }
}
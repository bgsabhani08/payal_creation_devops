import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class FirebaseService {

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Stream<List<ProjectModel>> getProjects() {

    return _firestore
        .collection('projects')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {

      return snapshot.docs.map((doc) {

        return ProjectModel.fromFirestore(
          doc.data(),
          doc.id,
        );

      }).toList();
    });
  }
}
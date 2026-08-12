import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/project_model.dart';

class ProjectService {

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Stream<List<ProjectModel>> getFeaturedProjects() {

    return _firestore

        .collection('projects')

//        .where(
//          'isFeatured',
//          isEqualTo: true,
//        )

        .orderBy(
          'createdAt',
          descending: true,
        )

        .limit(6)

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

  Stream<List<ProjectModel>> getAllProjects(){
    return _firestore.collection('projects').orderBy('createdAt',descending: true).snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        return ProjectModel.fromFirestore(
          doc.data(),
          doc.id, 
        );
      }).toList();
    });
  }
}
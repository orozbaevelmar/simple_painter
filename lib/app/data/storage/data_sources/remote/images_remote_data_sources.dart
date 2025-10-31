import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_painter/app/data/storage/models/image_model.dart';
import 'package:uuid/uuid.dart';

abstract class ImagesRemoteDataSource {
  Future<ImageModel> uploadFile({required ImageModel model});
  Stream<List<ImageModel>> imagesStream();
}

class ImagesRemoteDataSourceImpl implements ImagesRemoteDataSource {
  final FirebaseStorage firebaseStorage;
  final FirebaseFirestore firestore;
  ImagesRemoteDataSourceImpl({
    required this.firebaseStorage,
    required this.firestore,
  });

  @override
  Future<ImageModel> uploadFile({required ImageModel model}) async {
    final id = Uuid().v4();
    //final path = 'images/$id.jpg';
    //final ref = firebaseStorage.ref().child(path);

    // final uploadTask = await ref.putFile(file);
    // final url = await ref.getDownloadURL();

    await firestore.collection('images').doc(id).set(model.toMap());
    return model;
  }

  @override
  Stream<List<ImageModel>> imagesStream() {
    return firestore
        .collection('images')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snap) => snap.docs.map((d) => ImageModel.fromDoc(d)).toList());
  }
}

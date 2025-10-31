// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_painter/main.dart';

class ImageModel extends Equatable {
  final String? id;
  final String title;
  final DateTime date;
  final String author;
  final Uint8List? imageBytes;

  const ImageModel({
    this.id,
    required this.title,
    required this.date,
    required this.author,
    required this.imageBytes,
  });

  factory ImageModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    Uint8List? uint8list;
    try {
      uint8list = base64Decode(data['base64Image']);
    } catch (e) {
      logger.e('ImageModel.fromDoc error while converting to base64Decode');
    }
    print('---1222');
    print(data['date']);
    print('---1222');
    return ImageModel(
      id: doc.id,
      title: data['title'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(data['date']),
      author: data['author'] ?? '',
      imageBytes: uint8list,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'date': date.millisecondsSinceEpoch,
      'author': author,
      'base64Image': imageBytes != null ? base64Encode(imageBytes!) : null,
    };
  }

  @override
  List<Object?> get props => [id, title, date, author, imageBytes];
}

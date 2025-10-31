// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageModel extends Equatable {
  final String id;
  final String name;
  final String url;
  final DateTime date;
  final String author;

  const ImageModel({
    required this.id,
    required this.name,
    required this.url,
    required this.date,
    required this.author,
  });

  factory ImageModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ImageModel(
      id: doc.id,
      name: data['name'] ?? '',
      url: data['url'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
      author: data['author'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'url': url,
    'date': Timestamp.fromDate(date),
    'author': author,
  };

  @override
  List<Object?> get props => [id, name, url, date, author];
}

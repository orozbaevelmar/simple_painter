// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageModel extends Equatable {
  final String id;
  final String title;
  final String url;
  final DateTime date;
  final String author;

  const ImageModel({
    required this.id,
    required this.title,
    required this.url,
    required this.date,
    required this.author,
  });

  factory ImageModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ImageModel(
      id: doc.id,
      title: data['title'] ?? '',
      url: data['url'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
      author: data['author'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'title': title,
    'url': url,
    'date': Timestamp.fromDate(date),
    'author': author,
  };

  @override
  List<Object?> get props => [id, title, url, date, author];
}

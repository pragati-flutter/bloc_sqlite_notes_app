import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final int? id; // '?' means it can be null (for new notes)
  final String title;
  final String content;
  final String createdAt;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  // Convert Note object to Map (for SQLite)
  Map<String, dynamic> toMap() {
    return {
      'noteId': id,
      'title': title,
      'content': content,
      'createdAt': createdAt,
    };
  }

  // Create Note object from Map (from SQLite)
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['noteId'],
      title: map['title'],
      content: map['content'],
      createdAt: map['createdAt'],
    );
  }

  @override
  List<Object?> get props =>[id,title,content,createdAt];
}
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryEntry {
  final String emoji;
  final String title;
  final String body;
  final String documentId;
  DiaryEntry({
    this.emoji,
    this.title,
    this.body,
    this.documentId,
  });

  // DiaryEntry copyWith({
  //   String emoji,
  //   String title,
  //   String body,
  // }) {
  //   return DiaryEntry(
  //     emoji: emoji ?? this.emoji,
  //     title: title ?? this.title,
  //     body: body ?? this.body,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'emoji': emoji,
      'title': title,
      'body': body,
    };
  }

  static DiaryEntry fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DiaryEntry(
      emoji: map['emoji'],
      title: map['title'],
      body: map['body'],
    );
  }

  static DiaryEntry fromDoc(DocumentSnapshot doc) {
    if (doc == null) return null;

    return DiaryEntry(
      emoji: doc.data['emoji'],
      title: doc.data['title'],
      body: doc.data['body'],
      documentId: doc.documentID,
    );
  }

  // String toJson() => json.encode(toMap());

  // static DiaryEntry fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'DiaryEntry(emoji: $emoji, title: $title, body: $body)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DiaryEntry &&
        o.emoji == emoji &&
        o.title == title &&
        o.body == body;
  }

  @override
  int get hashCode => emoji.hashCode ^ title.hashCode ^ body.hashCode;
}

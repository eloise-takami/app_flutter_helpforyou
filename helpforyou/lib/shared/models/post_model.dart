import 'dart:convert';

class PostModel {
  final String content;
  final String categoria;
  late final String userName;
  final String userId;
  final int likes;
  final DateTime date;

  PostModel({
    required this.content,
    required this.categoria,
    required this.userName,
    required this.userId,
    required this.likes,
    required this.date,
  });

  PostModel copyWith({
    String? content,
    String? categoria,
    String? userName,
    String? userId,
    int? likes,
    DateTime? date,
  }) {
    return PostModel(
      content: content ?? this.content,
      categoria: categoria ?? this.categoria,
      userName: userName ?? this.userName,
      userId: userId ?? this.userId,
      likes: likes ?? this.likes,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'categoria': categoria,
      'userName': userName,
      'userId': userId,
      'likes': likes,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      content: map['content'],
      categoria: map['categoria'],
      userName: map['userName'],
      userId: map['userId'],
      likes: map['likes'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(content: $content, categoria: $categoria, userName: $userName, userId: $userId, likes: $likes, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostModel &&
        other.content == content &&
        other.categoria == categoria &&
        other.userName == userName &&
        other.userId == userId &&
        other.likes == likes &&
        other.date == date;
  }

  @override
  int get hashCode {
    return content.hashCode ^
        categoria.hashCode ^
        userName.hashCode ^
        userId.hashCode ^
        likes.hashCode ^
        date.hashCode;
  }
}

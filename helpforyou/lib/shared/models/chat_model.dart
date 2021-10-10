import 'dart:convert';

class ChatModel {
  final String content;
  final bool sentByPsychologist;
  final String groupId;
  final DateTime date;

  ChatModel({
    required this.content,
    required this.sentByPsychologist,
    required this.groupId,
    required this.date,
  });

  ChatModel copyWith({
    String? content,
    bool? sentByPsychologist,
    String? groupId,
    DateTime? date,
  }) {
    return ChatModel(
      content: content ?? this.content,
      sentByPsychologist: sentByPsychologist ?? this.sentByPsychologist,
      groupId: groupId ?? this.groupId,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'sentByPsychologist': sentByPsychologist,
      'groupId': groupId,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      content: map['content'],
      sentByPsychologist: map['sentByPsychologist'],
      groupId: map['groupId'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatModel(content: $content, sentByPsychologist: $sentByPsychologist, groupId: $groupId, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatModel &&
        other.content == content &&
        other.sentByPsychologist == sentByPsychologist &&
        other.groupId == groupId &&
        other.date == date;
  }

  @override
  int get hashCode {
    return content.hashCode ^
        sentByPsychologist.hashCode ^
        groupId.hashCode ^
        date.hashCode;
  }
}

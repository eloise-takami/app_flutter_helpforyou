import 'dart:convert';

class PsychologistModel {
  final String name;
  final String id;
  final String photoUrl;

  PsychologistModel({
    required this.name,
    required this.id,
    required this.photoUrl,
  });

  PsychologistModel copyWith({
    String? name,
    String? id,
    String? photoUrl,
  }) {
    return PsychologistModel(
      name: name ?? this.name,
      id: id ?? this.id,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'photoUrl': photoUrl,
    };
  }

  factory PsychologistModel.fromMap(Map<String, dynamic> map) {
    return PsychologistModel(
      name: map['name'],
      id: map['id'],
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PsychologistModel.fromJson(String source) =>
      PsychologistModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'PsychologistModel(name: $name, id: $id, photoUrl: $photoUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PsychologistModel &&
        other.name == name &&
        other.id == id &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ photoUrl.hashCode;
}

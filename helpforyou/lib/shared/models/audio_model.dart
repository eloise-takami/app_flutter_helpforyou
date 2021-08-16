import 'dart:convert';

class AudioModel {
  final String localPath;
  final String url;
  final String name;
  final DateTime date;
  final int durationInMilliseconds;

  AudioModel({
    required this.localPath,
    required this.url,
    required this.name,
    required this.date,
    required this.durationInMilliseconds,
  });

  AudioModel copyWith({
    String? localPath,
    String? url,
    String? name,
    DateTime? date,
    int? durationInMilliseconds,
  }) {
    return AudioModel(
      localPath: localPath ?? this.localPath,
      url: url ?? this.url,
      name: name ?? this.name,
      date: date ?? this.date,
      durationInMilliseconds:
          durationInMilliseconds ?? this.durationInMilliseconds,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'localPath': localPath,
      'url': url,
      'name': name,
      'date': date.millisecondsSinceEpoch,
      'durationInMilliseconds': durationInMilliseconds,
    };
  }

  factory AudioModel.fromMap(Map<String, dynamic> map) {
    return AudioModel(
      localPath: map['localPath'],
      url: map['url'],
      name: map['name'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      durationInMilliseconds: map['durationInMilliseconds'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AudioModel.fromJson(String source) =>
      AudioModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AudioModel(localPath: $localPath, url: $url, name: $name, date: $date, durationInMilliseconds: $durationInMilliseconds)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AudioModel &&
        other.localPath == localPath &&
        other.url == url &&
        other.name == name &&
        other.date == date &&
        other.durationInMilliseconds == durationInMilliseconds;
  }

  @override
  int get hashCode {
    return localPath.hashCode ^
        url.hashCode ^
        name.hashCode ^
        date.hashCode ^
        durationInMilliseconds.hashCode;
  }
}

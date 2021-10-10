class PostModel {
  final String content;

  PostModel({required this.content});

  Map<String, dynamic> toMap() {
    return {
      "content": this.content,
    };
  }
}

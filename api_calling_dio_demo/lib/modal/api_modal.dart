class ApiModal {
  int id;
  String content;
  String email;

  ApiModal({
    required this.id,
    required this.content,
    required this.email,
  });

  factory ApiModal.fromJson(Map<String, dynamic> data) => ApiModal(
        id: data['id'],
        content: data['content'],
        email: data['email'],
      );

  ApiModal copyWith({int? id, String? content, String? email}) {
    return ApiModal(id: id ?? this.id, content: content ?? this.content, email: email ?? this.email);
  }
}

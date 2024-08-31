class ApiModel {
  int id;
  String content;
  String email;

  ApiModel({required this.id, required this.email, required this.content});

  factory ApiModel.fromJson(Map<String, dynamic> data) => ApiModel(
        id: data['id'],
        email: data['email'],
        content: data['content'],
      );
}

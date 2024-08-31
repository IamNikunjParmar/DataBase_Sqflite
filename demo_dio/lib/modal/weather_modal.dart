class WeatherModel {
  int id;
  String content;
  String email;

  WeatherModel({
    required this.id,
    required this.content,
    required this.email,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      content: json['content'],
      email: json['email'],
    );
  }
}

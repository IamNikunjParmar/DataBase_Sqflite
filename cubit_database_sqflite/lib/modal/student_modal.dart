import 'package:json_annotation/json_annotation.dart';

part 'student_modal.g.dart';

@JsonSerializable()
class StudentModal {
  int? id;
  String name;
  String course;
  String number;

  StudentModal({this.id, required this.name, required this.number, required this.course});

  factory StudentModal.fromJson(Map<String, dynamic> data) => _$StudentModalFromJson(data);

  Map<String, dynamic> toJson() => _$StudentModalToJson(this);
}

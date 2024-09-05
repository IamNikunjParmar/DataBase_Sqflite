import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_modal.g.dart';

@JsonSerializable()
class StudentModal extends Equatable {
  int? id;
  String name;
  String course;
  String number;

  StudentModal({this.id, required this.name, required this.number, required this.course});

  factory StudentModal.fromJson(Map<String, dynamic> data) => _$StudentModalFromJson(data);

  Map<String, dynamic> toJson() => _$StudentModalToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        course,
        number,
      ];

  StudentModal copyWith({
    int? id,
    String? name,
    String? course,
    String? number,
  }) {
    return StudentModal(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      course: course ?? this.course,
    );
  }
}

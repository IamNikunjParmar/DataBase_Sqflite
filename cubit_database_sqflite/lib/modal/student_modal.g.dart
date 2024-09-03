// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentModal _$StudentModalFromJson(Map<String, dynamic> json) => StudentModal(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      number: json['number'] as String,
      course: json['course'] as String,
    );

Map<String, dynamic> _$StudentModalToJson(StudentModal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'course': instance.course,
      'number': instance.number,
    };

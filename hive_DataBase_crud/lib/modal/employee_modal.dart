import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'employee_modal.g.dart';

@HiveType(typeId: 0)
class EmployeeModal extends Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  int number;

  EmployeeModal({
    required this.id,
    required this.name,
    required this.email,
    required this.number,
  });

  EmployeeModal copyWith({int? id, String? name, String? email, int? number}) {
    return EmployeeModal(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      number: number ?? this.number,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        email,
        number,
      ];
}

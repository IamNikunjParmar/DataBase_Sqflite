// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeModalAdapter extends TypeAdapter<EmployeeModal> {
  @override
  final int typeId = 0;

  @override
  EmployeeModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeModal(
      id: fields[0] as int,
      name: fields[1] as String,
      email: fields[2] as String,
      number: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeModal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

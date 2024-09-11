// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_modal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModalAdapter extends TypeAdapter<CartModal> {
  @override
  final int typeId = 0;

  @override
  CartModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModal(
      id: fields[0] as int,
      title: fields[1] as String,
      thumbnail: fields[2] as String,
      price: fields[3] as double,
      quntitey: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartModal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.thumbnail)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.quntitey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

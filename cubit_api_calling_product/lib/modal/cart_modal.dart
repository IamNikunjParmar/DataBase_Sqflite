import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'cart_modal.g.dart';

@HiveType(typeId: 0)
class CartModal extends Equatable {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String thumbnail;

  @HiveField(3)
  double price;

  @HiveField(4)
  int quntitey;

  @HiveField(5)
  double? totalPrice;

  CartModal({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.quntitey,
    this.totalPrice,
  });

  CartModal copyWith({int? id, String? title, String? thumbnail, double? price, int? quntitey, double? totalPrice}) {
    return CartModal(
      id: id ?? this.id,
      title: title ?? this.title,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
      quntitey: quntitey ?? this.quntitey,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        thumbnail,
        price,
        quntitey,
      ];
}

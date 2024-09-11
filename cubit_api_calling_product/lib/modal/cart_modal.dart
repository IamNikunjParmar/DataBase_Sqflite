import 'package:hive/hive.dart';

part 'cart_modal.g.dart';

@HiveType(typeId: 0)
class CartModal extends HiveObject {
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

  CartModal({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.quntitey,
  });
}

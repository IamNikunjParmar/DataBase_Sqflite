import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_modal.g.dart';

@JsonSerializable()
class ProductModal {
  int id;
  String title;
  String description;
  String category;
  double price;
  double rating;
  List<String> tags;
  String? brand;
  List<Review> reviews;
  List<String> images;
  String thumbnail;

  ProductModal(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.rating,
      required this.tags,
      required this.brand,
      required this.reviews,
      required this.images,
      required this.thumbnail});

  factory ProductModal.fromJson(Map<String, dynamic> data) => _$ProductModalFromJson(data);

  Map<String, dynamic> toJson() => _$ProductModalToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        price,
        rating,
        tags,
        brand,
        reviews,
        images,
        thumbnail,
      ];

  ProductModal copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? rating,
    List<String>? tags,
    String? brand,
    List<Review>? reviews,
    List<String>? images,
    String? thumbnail,
  }) {
    return ProductModal(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      tags: tags ?? this.tags,
      brand: brand ?? this.brand,
      reviews: reviews ?? this.reviews,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}

@JsonSerializable()
class Review extends Equatable {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  const Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  @override
  List<Object?> get props => [rating, comment, date, reviewerName, reviewerEmail];

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

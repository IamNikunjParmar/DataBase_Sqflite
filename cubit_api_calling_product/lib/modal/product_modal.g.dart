// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModal _$ProductModalFromJson(Map<String, dynamic> json) => ProductModal(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      brand: json['brand'] as String?,
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$ProductModalToJson(ProductModal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'rating': instance.rating,
      'tags': instance.tags,
      'brand': instance.brand,
      'reviews': instance.reviews,
      'images': instance.images,
      'thumbnail': instance.thumbnail,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String,
      date: json['date'] as String,
      reviewerName: json['reviewerName'] as String,
      reviewerEmail: json['reviewerEmail'] as String,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date,
      'reviewerName': instance.reviewerName,
      'reviewerEmail': instance.reviewerEmail,
    };

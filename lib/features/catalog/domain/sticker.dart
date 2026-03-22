// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Sticker {
  final String id;
  final String categoryId;
  final String stickerCode;
  final String? description;
  final int orderIndex;
  Sticker({
    required this.id,
    required this.categoryId,
    required this.stickerCode,
    this.description,
    required this.orderIndex,
  });

  Sticker copyWith({
    String? id,
    String? categoryId,
    String? stickerCode,
    String? description,
    int? orderIndex,
  }) {
    return Sticker(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      stickerCode: stickerCode ?? this.stickerCode,
      description: description ?? this.description,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category_id': categoryId,
      'sticker_code': stickerCode,
      'description': description,
      'order_index': orderIndex,
    };
  }

  factory Sticker.fromMap(Map<String, dynamic> map) {
    return Sticker(
      id: map['id'] as String,
      categoryId: map['category_id'] as String,
      stickerCode: map['sticker_code'] as String,
      description: map['description'] as String?,
      orderIndex: map['order_index'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sticker.fromJson(String source) =>
      Sticker.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Sticker(id: $id, categoryId: $categoryId, stickerCode: $stickerCode, description: $description, orderIndex: $orderIndex)';
  }

  @override
  bool operator ==(covariant Sticker other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.categoryId == categoryId &&
        other.stickerCode == stickerCode &&
        other.description == description &&
        other.orderIndex == orderIndex;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryId.hashCode ^
        stickerCode.hashCode ^
        description.hashCode ^
        orderIndex.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  final String id;
  final String name;
  final int orderIndex;
  final String? iconUrl;
  Category({
    required this.id,
    required this.name,
    required this.orderIndex,
    this.iconUrl,
  });

  Category copyWith({
    String? id,
    String? name,
    int? orderIndex,
    String? iconUrl,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      orderIndex: orderIndex ?? this.orderIndex,
      iconUrl: iconUrl ?? this.iconUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'order_index': orderIndex,
      'icon_url': iconUrl,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as String,
      name: map['name'] as String,
      orderIndex: map['order_index'] as int,
      iconUrl: map['icon_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(id: $id, name: $name, orderIndex: $orderIndex, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.orderIndex == orderIndex &&
        other.iconUrl == iconUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ orderIndex.hashCode ^ iconUrl.hashCode;
  }
}

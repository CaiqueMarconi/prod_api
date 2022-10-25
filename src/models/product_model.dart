// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final bool available;
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.available,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? description,
    String? price,
    bool? available,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      available: available ?? this.available,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'available': available,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      available: map['available'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, price: $price, available: $available)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.available == available;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        available.hashCode;
  }
}

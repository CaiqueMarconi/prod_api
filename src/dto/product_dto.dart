// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductDTO {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final bool? available;
  ProductDTO({
    this.id,
    this.name,
    this.description,
    this.price,
    this.available,
  });

  ProductDTO copyWith({
    int? id,
    String? name,
    String? description,
    String? price,
    bool? available,
  }) {
    return ProductDTO(
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

  factory ProductDTO.fromMap(Map<String, dynamic> map) {
    return ProductDTO(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      available: map['available'] != null ? map['available'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDTO.fromJson(String source) =>
      ProductDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductDTO(id: $id, name: $name, description: $description, price: $price, available: $available)';
  }

  @override
  bool operator ==(covariant ProductDTO other) {
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

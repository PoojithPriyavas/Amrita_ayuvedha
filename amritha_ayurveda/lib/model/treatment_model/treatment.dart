import 'branch.dart';

class Treatment {
  int? id;
  List<Branch>? branches;
  String? name;
  String? duration;
  String? price;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  Treatment({
    this.id,
    this.branches,
    this.name,
    this.duration,
    this.price,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Treatment.fromJson(Map<String, dynamic> json) => Treatment(
        id: json['id'] as int?,
        branches: (json['branches'] as List<dynamic>?)
            ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
            .toList(),
        name: json['name'] as String?,
        duration: json['duration'] as String?,
        price: json['price'] as String?,
        isActive: json['is_active'] as bool?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'branches': branches?.map((e) => e.toJson()).toList(),
        'name': name,
        'duration': duration,
        'price': price,
        'is_active': isActive,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}

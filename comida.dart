// lib/models/comida.dart
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comida.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Comida {
  @HiveField(0)
  final String nombre;

  @HiveField(1)
  final double calorias;

  @HiveField(2)
  final double proteinas;

  Comida({
    required this.nombre,
    required this.calorias,
    required this.proteinas,
  });

  factory Comida.fromJson(Map<String, dynamic> json) => _$ComidaFromJson(json);
  Map<String, dynamic> toJson() => _$ComidaToJson(this);
}
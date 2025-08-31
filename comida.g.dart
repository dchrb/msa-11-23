// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comida.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComidaAdapter extends TypeAdapter<Comida> {
  @override
  final int typeId = 0;

  @override
  Comida read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Comida(
      nombre: fields[0] as String,
      calorias: fields[1] as double,
      proteinas: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Comida obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nombre)
      ..writeByte(1)
      ..write(obj.calorias)
      ..writeByte(2)
      ..write(obj.proteinas);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComidaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comida _$ComidaFromJson(Map<String, dynamic> json) => Comida(
      nombre: json['nombre'] as String,
      calorias: (json['calorias'] as num).toDouble(),
      proteinas: (json['proteinas'] as num).toDouble(),
    );

Map<String, dynamic> _$ComidaToJson(Comida instance) => <String, dynamic>{
      'nombre': instance.nombre,
      'calorias': instance.calorias,
      'proteinas': instance.proteinas,
    };

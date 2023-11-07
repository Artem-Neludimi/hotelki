// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotelka_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HotelkaModelImpl _$$HotelkaModelImplFromJson(Map<String, dynamic> json) =>
    _$HotelkaModelImpl(
      email: json['email'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      references: json['references'],
      category: json['category'] as String,
      isImportant: json['isImportant'] as bool,
      isDone: json['isDone'] as bool,
      date: json['date'] as String,
      periodicity: json['periodicity'] as String,
    );

Map<String, dynamic> _$$HotelkaModelImplToJson(_$HotelkaModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'description': instance.description,
      'references': instance.references,
      'category': instance.category,
      'isImportant': instance.isImportant,
      'isDone': instance.isDone,
      'date': instance.date,
      'periodicity': instance.periodicity,
    };

import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotelka_model.freezed.dart';
part 'hotelka_model.g.dart';

@freezed
class HotelkaModel with _$HotelkaModel {
  factory HotelkaModel({
    required String email,
    required String name,
    required String description,
    required dynamic references,
    required String category,
    required bool isImportant,
    required bool isDone,
    required String date,
    required String periodicity,
  }) = _HotelkaModel;

  factory HotelkaModel.fromJson(Map<String, dynamic> json) => _$HotelkaModelFromJson(json);
}

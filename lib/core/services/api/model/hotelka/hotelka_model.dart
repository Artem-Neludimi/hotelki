import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotelka_model.freezed.dart';
part 'hotelka_model.g.dart';

@freezed
class HotelkaModel with _$HotelkaModel {
  @JsonSerializable(explicitToJson: true)
  const factory HotelkaModel({
    required String email,
    required String name,
    required String description,
    ReferencesModel? references,
    required String category,
    required bool isImportant,
    required bool isDone,
    required String date,
    required String periodicity,
  }) = _HotelkaModel;

  factory HotelkaModel.fromJson(Map<String, dynamic> json) => _$HotelkaModelFromJson(json);
}

@freezed
class ReferencesModel with _$ReferencesModel {
  factory ReferencesModel({
    String? link,
    List<String>? imageUrls,
  }) = _ReferencesModel;

  factory ReferencesModel.fromJson(Map<String, dynamic> json) => _$ReferencesModelFromJson(json);
}

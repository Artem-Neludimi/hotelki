// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotelka_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HotelkaModel _$HotelkaModelFromJson(Map<String, dynamic> json) {
  return _HotelkaModel.fromJson(json);
}

/// @nodoc
mixin _$HotelkaModel {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  dynamic get references => throw _privateConstructorUsedError;
  bool get isImportant => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get periodicity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HotelkaModelCopyWith<HotelkaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelkaModelCopyWith<$Res> {
  factory $HotelkaModelCopyWith(
          HotelkaModel value, $Res Function(HotelkaModel) then) =
      _$HotelkaModelCopyWithImpl<$Res, HotelkaModel>;
  @useResult
  $Res call(
      {String name,
      String description,
      dynamic references,
      bool isImportant,
      bool isDone,
      String date,
      String periodicity});
}

/// @nodoc
class _$HotelkaModelCopyWithImpl<$Res, $Val extends HotelkaModel>
    implements $HotelkaModelCopyWith<$Res> {
  _$HotelkaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? references = freezed,
    Object? isImportant = null,
    Object? isDone = null,
    Object? date = null,
    Object? periodicity = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      references: freezed == references
          ? _value.references
          : references // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isImportant: null == isImportant
          ? _value.isImportant
          : isImportant // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      periodicity: null == periodicity
          ? _value.periodicity
          : periodicity // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HotelkaModelImplCopyWith<$Res>
    implements $HotelkaModelCopyWith<$Res> {
  factory _$$HotelkaModelImplCopyWith(
          _$HotelkaModelImpl value, $Res Function(_$HotelkaModelImpl) then) =
      __$$HotelkaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      dynamic references,
      bool isImportant,
      bool isDone,
      String date,
      String periodicity});
}

/// @nodoc
class __$$HotelkaModelImplCopyWithImpl<$Res>
    extends _$HotelkaModelCopyWithImpl<$Res, _$HotelkaModelImpl>
    implements _$$HotelkaModelImplCopyWith<$Res> {
  __$$HotelkaModelImplCopyWithImpl(
      _$HotelkaModelImpl _value, $Res Function(_$HotelkaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? references = freezed,
    Object? isImportant = null,
    Object? isDone = null,
    Object? date = null,
    Object? periodicity = null,
  }) {
    return _then(_$HotelkaModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      references: freezed == references
          ? _value.references
          : references // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isImportant: null == isImportant
          ? _value.isImportant
          : isImportant // ignore: cast_nullable_to_non_nullable
              as bool,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      periodicity: null == periodicity
          ? _value.periodicity
          : periodicity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HotelkaModelImpl implements _HotelkaModel {
  _$HotelkaModelImpl(
      {required this.name,
      required this.description,
      required this.references,
      required this.isImportant,
      required this.isDone,
      required this.date,
      required this.periodicity});

  factory _$HotelkaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotelkaModelImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final dynamic references;
  @override
  final bool isImportant;
  @override
  final bool isDone;
  @override
  final String date;
  @override
  final String periodicity;

  @override
  String toString() {
    return 'HotelkaModel(name: $name, description: $description, references: $references, isImportant: $isImportant, isDone: $isDone, date: $date, periodicity: $periodicity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelkaModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.references, references) &&
            (identical(other.isImportant, isImportant) ||
                other.isImportant == isImportant) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.periodicity, periodicity) ||
                other.periodicity == periodicity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      const DeepCollectionEquality().hash(references),
      isImportant,
      isDone,
      date,
      periodicity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelkaModelImplCopyWith<_$HotelkaModelImpl> get copyWith =>
      __$$HotelkaModelImplCopyWithImpl<_$HotelkaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HotelkaModelImplToJson(
      this,
    );
  }
}

abstract class _HotelkaModel implements HotelkaModel {
  factory _HotelkaModel(
      {required final String name,
      required final String description,
      required final dynamic references,
      required final bool isImportant,
      required final bool isDone,
      required final String date,
      required final String periodicity}) = _$HotelkaModelImpl;

  factory _HotelkaModel.fromJson(Map<String, dynamic> json) =
      _$HotelkaModelImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  dynamic get references;
  @override
  bool get isImportant;
  @override
  bool get isDone;
  @override
  String get date;
  @override
  String get periodicity;
  @override
  @JsonKey(ignore: true)
  _$$HotelkaModelImplCopyWith<_$HotelkaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ReferencesModel? get references => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
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
      {String email,
      String name,
      String description,
      ReferencesModel? references,
      String category,
      bool isImportant,
      bool isDone,
      String date,
      String periodicity});

  $ReferencesModelCopyWith<$Res>? get references;
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
    Object? email = null,
    Object? name = null,
    Object? description = null,
    Object? references = freezed,
    Object? category = null,
    Object? isImportant = null,
    Object? isDone = null,
    Object? date = null,
    Object? periodicity = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
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
              as ReferencesModel?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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

  @override
  @pragma('vm:prefer-inline')
  $ReferencesModelCopyWith<$Res>? get references {
    if (_value.references == null) {
      return null;
    }

    return $ReferencesModelCopyWith<$Res>(_value.references!, (value) {
      return _then(_value.copyWith(references: value) as $Val);
    });
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
      {String email,
      String name,
      String description,
      ReferencesModel? references,
      String category,
      bool isImportant,
      bool isDone,
      String date,
      String periodicity});

  @override
  $ReferencesModelCopyWith<$Res>? get references;
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
    Object? email = null,
    Object? name = null,
    Object? description = null,
    Object? references = freezed,
    Object? category = null,
    Object? isImportant = null,
    Object? isDone = null,
    Object? date = null,
    Object? periodicity = null,
  }) {
    return _then(_$HotelkaModelImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
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
              as ReferencesModel?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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

@JsonSerializable(explicitToJson: true)
class _$HotelkaModelImpl implements _HotelkaModel {
  const _$HotelkaModelImpl(
      {required this.email,
      required this.name,
      required this.description,
      this.references,
      required this.category,
      required this.isImportant,
      required this.isDone,
      required this.date,
      required this.periodicity});

  factory _$HotelkaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotelkaModelImplFromJson(json);

  @override
  final String email;
  @override
  final String name;
  @override
  final String description;
  @override
  final ReferencesModel? references;
  @override
  final String category;
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
    return 'HotelkaModel(email: $email, name: $name, description: $description, references: $references, category: $category, isImportant: $isImportant, isDone: $isDone, date: $date, periodicity: $periodicity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelkaModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.references, references) ||
                other.references == references) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isImportant, isImportant) ||
                other.isImportant == isImportant) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.periodicity, periodicity) ||
                other.periodicity == periodicity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, name, description,
      references, category, isImportant, isDone, date, periodicity);

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
  const factory _HotelkaModel(
      {required final String email,
      required final String name,
      required final String description,
      final ReferencesModel? references,
      required final String category,
      required final bool isImportant,
      required final bool isDone,
      required final String date,
      required final String periodicity}) = _$HotelkaModelImpl;

  factory _HotelkaModel.fromJson(Map<String, dynamic> json) =
      _$HotelkaModelImpl.fromJson;

  @override
  String get email;
  @override
  String get name;
  @override
  String get description;
  @override
  ReferencesModel? get references;
  @override
  String get category;
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

ReferencesModel _$ReferencesModelFromJson(Map<String, dynamic> json) {
  return _ReferencesModel.fromJson(json);
}

/// @nodoc
mixin _$ReferencesModel {
  String? get link => throw _privateConstructorUsedError;
  List<String>? get imageUrls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferencesModelCopyWith<ReferencesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferencesModelCopyWith<$Res> {
  factory $ReferencesModelCopyWith(
          ReferencesModel value, $Res Function(ReferencesModel) then) =
      _$ReferencesModelCopyWithImpl<$Res, ReferencesModel>;
  @useResult
  $Res call({String? link, List<String>? imageUrls});
}

/// @nodoc
class _$ReferencesModelCopyWithImpl<$Res, $Val extends ReferencesModel>
    implements $ReferencesModelCopyWith<$Res> {
  _$ReferencesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = freezed,
    Object? imageUrls = freezed,
  }) {
    return _then(_value.copyWith(
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferencesModelImplCopyWith<$Res>
    implements $ReferencesModelCopyWith<$Res> {
  factory _$$ReferencesModelImplCopyWith(_$ReferencesModelImpl value,
          $Res Function(_$ReferencesModelImpl) then) =
      __$$ReferencesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? link, List<String>? imageUrls});
}

/// @nodoc
class __$$ReferencesModelImplCopyWithImpl<$Res>
    extends _$ReferencesModelCopyWithImpl<$Res, _$ReferencesModelImpl>
    implements _$$ReferencesModelImplCopyWith<$Res> {
  __$$ReferencesModelImplCopyWithImpl(
      _$ReferencesModelImpl _value, $Res Function(_$ReferencesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = freezed,
    Object? imageUrls = freezed,
  }) {
    return _then(_$ReferencesModelImpl(
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferencesModelImpl implements _ReferencesModel {
  _$ReferencesModelImpl({this.link, final List<String>? imageUrls})
      : _imageUrls = imageUrls;

  factory _$ReferencesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferencesModelImplFromJson(json);

  @override
  final String? link;
  final List<String>? _imageUrls;
  @override
  List<String>? get imageUrls {
    final value = _imageUrls;
    if (value == null) return null;
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReferencesModel(link: $link, imageUrls: $imageUrls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferencesModelImpl &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, link, const DeepCollectionEquality().hash(_imageUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferencesModelImplCopyWith<_$ReferencesModelImpl> get copyWith =>
      __$$ReferencesModelImplCopyWithImpl<_$ReferencesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferencesModelImplToJson(
      this,
    );
  }
}

abstract class _ReferencesModel implements ReferencesModel {
  factory _ReferencesModel(
      {final String? link,
      final List<String>? imageUrls}) = _$ReferencesModelImpl;

  factory _ReferencesModel.fromJson(Map<String, dynamic> json) =
      _$ReferencesModelImpl.fromJson;

  @override
  String? get link;
  @override
  List<String>? get imageUrls;
  @override
  @JsonKey(ignore: true)
  _$$ReferencesModelImplCopyWith<_$ReferencesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

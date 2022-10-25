// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catagory_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CatagoryStruct> _$catagoryStructSerializer =
    new _$CatagoryStructSerializer();

class _$CatagoryStructSerializer
    implements StructuredSerializer<CatagoryStruct> {
  @override
  final Iterable<Type> types = const [CatagoryStruct, _$CatagoryStruct];
  @override
  final String wireName = 'CatagoryStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, CatagoryStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CatagoryStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CatagoryStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$CatagoryStruct extends CatagoryStruct {
  @override
  final String? title;
  @override
  final String? description;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$CatagoryStruct([void Function(CatagoryStructBuilder)? updates]) =>
      (new CatagoryStructBuilder()..update(updates))._build();

  _$CatagoryStruct._(
      {this.title, this.description, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'CatagoryStruct', 'firestoreUtilData');
  }

  @override
  CatagoryStruct rebuild(void Function(CatagoryStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatagoryStructBuilder toBuilder() =>
      new CatagoryStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CatagoryStruct &&
        title == other.title &&
        description == other.description &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, title.hashCode), description.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CatagoryStruct')
          ..add('title', title)
          ..add('description', description)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class CatagoryStructBuilder
    implements Builder<CatagoryStruct, CatagoryStructBuilder> {
  _$CatagoryStruct? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  CatagoryStructBuilder() {
    CatagoryStruct._initializeBuilder(this);
  }

  CatagoryStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CatagoryStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CatagoryStruct;
  }

  @override
  void update(void Function(CatagoryStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CatagoryStruct build() => _build();

  _$CatagoryStruct _build() {
    final _$result = _$v ??
        new _$CatagoryStruct._(
            title: title,
            description: description,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'CatagoryStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

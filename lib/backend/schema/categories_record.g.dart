// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoriesRecord> _$categoriesRecordSerializer =
    new _$CategoriesRecordSerializer();

class _$CategoriesRecordSerializer
    implements StructuredSerializer<CategoriesRecord> {
  @override
  final Iterable<Type> types = const [CategoriesRecord, _$CategoriesRecord];
  @override
  final String wireName = 'CategoriesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CategoriesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  CategoriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$CategoriesRecord extends CategoriesRecord {
  @override
  final int? id;
  @override
  final String? title;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CategoriesRecord(
          [void Function(CategoriesRecordBuilder)? updates]) =>
      (new CategoriesRecordBuilder()..update(updates))._build();

  _$CategoriesRecord._({this.id, this.title, this.ffRef}) : super._();

  @override
  CategoriesRecord rebuild(void Function(CategoriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriesRecordBuilder toBuilder() =>
      new CategoriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoriesRecord &&
        id == other.id &&
        title == other.title &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), title.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoriesRecord')
          ..add('id', id)
          ..add('title', title)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CategoriesRecordBuilder
    implements Builder<CategoriesRecord, CategoriesRecordBuilder> {
  _$CategoriesRecord? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CategoriesRecordBuilder() {
    CategoriesRecord._initializeBuilder(this);
  }

  CategoriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoriesRecord;
  }

  @override
  void update(void Function(CategoriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoriesRecord build() => _build();

  _$CategoriesRecord _build() {
    final _$result =
        _$v ?? new _$CategoriesRecord._(id: id, title: title, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

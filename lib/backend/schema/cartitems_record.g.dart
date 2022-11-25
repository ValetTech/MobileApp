// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartitems_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CartitemsRecord> _$cartitemsRecordSerializer =
    new _$CartitemsRecordSerializer();

class _$CartitemsRecordSerializer
    implements StructuredSerializer<CartitemsRecord> {
  @override
  final Iterable<Type> types = const [CartitemsRecord, _$CartitemsRecord];
  @override
  final String wireName = 'CartitemsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CartitemsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.item;
    if (value != null) {
      result
        ..add('item')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.quantity;
    if (value != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  CartitemsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartitemsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'item':
          result.item = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$CartitemsRecord extends CartitemsRecord {
  @override
  final DocumentReference<Object?>? item;
  @override
  final int? quantity;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CartitemsRecord([void Function(CartitemsRecordBuilder)? updates]) =>
      (new CartitemsRecordBuilder()..update(updates))._build();

  _$CartitemsRecord._({this.item, this.quantity, this.ffRef}) : super._();

  @override
  CartitemsRecord rebuild(void Function(CartitemsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartitemsRecordBuilder toBuilder() =>
      new CartitemsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartitemsRecord &&
        item == other.item &&
        quantity == other.quantity &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, item.hashCode), quantity.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CartitemsRecord')
          ..add('item', item)
          ..add('quantity', quantity)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CartitemsRecordBuilder
    implements Builder<CartitemsRecord, CartitemsRecordBuilder> {
  _$CartitemsRecord? _$v;

  DocumentReference<Object?>? _item;
  DocumentReference<Object?>? get item => _$this._item;
  set item(DocumentReference<Object?>? item) => _$this._item = item;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CartitemsRecordBuilder() {
    CartitemsRecord._initializeBuilder(this);
  }

  CartitemsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _item = $v.item;
      _quantity = $v.quantity;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartitemsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CartitemsRecord;
  }

  @override
  void update(void Function(CartitemsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CartitemsRecord build() => _build();

  _$CartitemsRecord _build() {
    final _$result = _$v ??
        new _$CartitemsRecord._(item: item, quantity: quantity, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CartStruct> _$cartStructSerializer = new _$CartStructSerializer();

class _$CartStructSerializer implements StructuredSerializer<CartStruct> {
  @override
  final Iterable<Type> types = const [CartStruct, _$CartStruct];
  @override
  final String wireName = 'CartStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, CartStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.itemRef;
    if (value != null) {
      result
        ..add('item_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.qty;
    if (value != null) {
      result
        ..add('qty')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  CartStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'item_ref':
          result.itemRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'qty':
          result.qty = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$CartStruct extends CartStruct {
  @override
  final DocumentReference<Object?>? itemRef;
  @override
  final int? qty;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$CartStruct([void Function(CartStructBuilder)? updates]) =>
      (new CartStructBuilder()..update(updates))._build();

  _$CartStruct._({this.itemRef, this.qty, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'CartStruct', 'firestoreUtilData');
  }

  @override
  CartStruct rebuild(void Function(CartStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartStructBuilder toBuilder() => new CartStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartStruct &&
        itemRef == other.itemRef &&
        qty == other.qty &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, itemRef.hashCode), qty.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CartStruct')
          ..add('itemRef', itemRef)
          ..add('qty', qty)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class CartStructBuilder implements Builder<CartStruct, CartStructBuilder> {
  _$CartStruct? _$v;

  DocumentReference<Object?>? _itemRef;
  DocumentReference<Object?>? get itemRef => _$this._itemRef;
  set itemRef(DocumentReference<Object?>? itemRef) => _$this._itemRef = itemRef;

  int? _qty;
  int? get qty => _$this._qty;
  set qty(int? qty) => _$this._qty = qty;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  CartStructBuilder() {
    CartStruct._initializeBuilder(this);
  }

  CartStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemRef = $v.itemRef;
      _qty = $v.qty;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CartStruct;
  }

  @override
  void update(void Function(CartStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CartStruct build() => _build();

  _$CartStruct _build() {
    final _$result = _$v ??
        new _$CartStruct._(
            itemRef: itemRef,
            qty: qty,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'CartStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

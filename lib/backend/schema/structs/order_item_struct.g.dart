// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderItemStruct> _$orderItemStructSerializer =
    new _$OrderItemStructSerializer();

class _$OrderItemStructSerializer
    implements StructuredSerializer<OrderItemStruct> {
  @override
  final Iterable<Type> types = const [OrderItemStruct, _$OrderItemStruct];
  @override
  final String wireName = 'OrderItemStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, OrderItemStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.itemId;
    if (value != null) {
      result
        ..add('itemId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.quantity;
    if (value != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.unitPrice;
    if (value != null) {
      result
        ..add('unitPrice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  OrderItemStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderItemStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'itemId':
          result.itemId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'unitPrice':
          result.unitPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$OrderItemStruct extends OrderItemStruct {
  @override
  final int? itemId;
  @override
  final int? quantity;
  @override
  final double? unitPrice;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$OrderItemStruct([void Function(OrderItemStructBuilder)? updates]) =>
      (new OrderItemStructBuilder()..update(updates))._build();

  _$OrderItemStruct._(
      {this.itemId,
      this.quantity,
      this.unitPrice,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'OrderItemStruct', 'firestoreUtilData');
  }

  @override
  OrderItemStruct rebuild(void Function(OrderItemStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderItemStructBuilder toBuilder() =>
      new OrderItemStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderItemStruct &&
        itemId == other.itemId &&
        quantity == other.quantity &&
        unitPrice == other.unitPrice &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, itemId.hashCode), quantity.hashCode),
            unitPrice.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderItemStruct')
          ..add('itemId', itemId)
          ..add('quantity', quantity)
          ..add('unitPrice', unitPrice)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class OrderItemStructBuilder
    implements Builder<OrderItemStruct, OrderItemStructBuilder> {
  _$OrderItemStruct? _$v;

  int? _itemId;
  int? get itemId => _$this._itemId;
  set itemId(int? itemId) => _$this._itemId = itemId;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  double? _unitPrice;
  double? get unitPrice => _$this._unitPrice;
  set unitPrice(double? unitPrice) => _$this._unitPrice = unitPrice;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  OrderItemStructBuilder() {
    OrderItemStruct._initializeBuilder(this);
  }

  OrderItemStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemId = $v.itemId;
      _quantity = $v.quantity;
      _unitPrice = $v.unitPrice;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderItemStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderItemStruct;
  }

  @override
  void update(void Function(OrderItemStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderItemStruct build() => _build();

  _$OrderItemStruct _build() {
    final _$result = _$v ??
        new _$OrderItemStruct._(
            itemId: itemId,
            quantity: quantity,
            unitPrice: unitPrice,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'OrderItemStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

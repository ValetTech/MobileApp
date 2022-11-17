// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cart_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserCartRecord> _$userCartRecordSerializer =
    new _$UserCartRecordSerializer();

class _$UserCartRecordSerializer
    implements StructuredSerializer<UserCartRecord> {
  @override
  final Iterable<Type> types = const [UserCartRecord, _$UserCartRecord];
  @override
  final String wireName = 'UserCartRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserCartRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.quantity;
    if (value != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.itemRef;
    if (value != null) {
      result
        ..add('item_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.itemName;
    if (value != null) {
      result
        ..add('item_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.itemImage;
    if (value != null) {
      result
        ..add('item_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.itemPrice;
    if (value != null) {
      result
        ..add('item_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.cartItemTotal;
    if (value != null) {
      result
        ..add('cart_item_total')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  UserCartRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserCartRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'item_ref':
          result.itemRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'item_name':
          result.itemName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'item_image':
          result.itemImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'item_price':
          result.itemPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'cart_item_total':
          result.cartItemTotal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$UserCartRecord extends UserCartRecord {
  @override
  final int? quantity;
  @override
  final DocumentReference<Object?>? itemRef;
  @override
  final String? itemName;
  @override
  final String? itemImage;
  @override
  final double? itemPrice;
  @override
  final double? cartItemTotal;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserCartRecord([void Function(UserCartRecordBuilder)? updates]) =>
      (new UserCartRecordBuilder()..update(updates))._build();

  _$UserCartRecord._(
      {this.quantity,
      this.itemRef,
      this.itemName,
      this.itemImage,
      this.itemPrice,
      this.cartItemTotal,
      this.userRef,
      this.ffRef})
      : super._();

  @override
  UserCartRecord rebuild(void Function(UserCartRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserCartRecordBuilder toBuilder() =>
      new UserCartRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserCartRecord &&
        quantity == other.quantity &&
        itemRef == other.itemRef &&
        itemName == other.itemName &&
        itemImage == other.itemImage &&
        itemPrice == other.itemPrice &&
        cartItemTotal == other.cartItemTotal &&
        userRef == other.userRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, quantity.hashCode), itemRef.hashCode),
                            itemName.hashCode),
                        itemImage.hashCode),
                    itemPrice.hashCode),
                cartItemTotal.hashCode),
            userRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserCartRecord')
          ..add('quantity', quantity)
          ..add('itemRef', itemRef)
          ..add('itemName', itemName)
          ..add('itemImage', itemImage)
          ..add('itemPrice', itemPrice)
          ..add('cartItemTotal', cartItemTotal)
          ..add('userRef', userRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserCartRecordBuilder
    implements Builder<UserCartRecord, UserCartRecordBuilder> {
  _$UserCartRecord? _$v;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  DocumentReference<Object?>? _itemRef;
  DocumentReference<Object?>? get itemRef => _$this._itemRef;
  set itemRef(DocumentReference<Object?>? itemRef) => _$this._itemRef = itemRef;

  String? _itemName;
  String? get itemName => _$this._itemName;
  set itemName(String? itemName) => _$this._itemName = itemName;

  String? _itemImage;
  String? get itemImage => _$this._itemImage;
  set itemImage(String? itemImage) => _$this._itemImage = itemImage;

  double? _itemPrice;
  double? get itemPrice => _$this._itemPrice;
  set itemPrice(double? itemPrice) => _$this._itemPrice = itemPrice;

  double? _cartItemTotal;
  double? get cartItemTotal => _$this._cartItemTotal;
  set cartItemTotal(double? cartItemTotal) =>
      _$this._cartItemTotal = cartItemTotal;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserCartRecordBuilder() {
    UserCartRecord._initializeBuilder(this);
  }

  UserCartRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quantity = $v.quantity;
      _itemRef = $v.itemRef;
      _itemName = $v.itemName;
      _itemImage = $v.itemImage;
      _itemPrice = $v.itemPrice;
      _cartItemTotal = $v.cartItemTotal;
      _userRef = $v.userRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserCartRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserCartRecord;
  }

  @override
  void update(void Function(UserCartRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserCartRecord build() => _build();

  _$UserCartRecord _build() {
    final _$result = _$v ??
        new _$UserCartRecord._(
            quantity: quantity,
            itemRef: itemRef,
            itemName: itemName,
            itemImage: itemImage,
            itemPrice: itemPrice,
            cartItemTotal: cartItemTotal,
            userRef: userRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MenuRecord> _$menuRecordSerializer = new _$MenuRecordSerializer();

class _$MenuRecordSerializer implements StructuredSerializer<MenuRecord> {
  @override
  final Iterable<Type> types = const [MenuRecord, _$MenuRecord];
  @override
  final String wireName = 'MenuRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MenuRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cartQty;
    if (value != null) {
      result
        ..add('cart_qty')
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
  MenuRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MenuRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cart_qty':
          result.cartQty = serializers.deserialize(value,
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

class _$MenuRecord extends MenuRecord {
  @override
  final String? category;
  @override
  final DateTime? createdAt;
  @override
  final String? description;
  @override
  final String? name;
  @override
  final double? price;
  @override
  final String? image;
  @override
  final int? cartQty;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MenuRecord([void Function(MenuRecordBuilder)? updates]) =>
      (new MenuRecordBuilder()..update(updates))._build();

  _$MenuRecord._(
      {this.category,
      this.createdAt,
      this.description,
      this.name,
      this.price,
      this.image,
      this.cartQty,
      this.ffRef})
      : super._();

  @override
  MenuRecord rebuild(void Function(MenuRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MenuRecordBuilder toBuilder() => new MenuRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuRecord &&
        category == other.category &&
        createdAt == other.createdAt &&
        description == other.description &&
        name == other.name &&
        price == other.price &&
        image == other.image &&
        cartQty == other.cartQty &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, category.hashCode), createdAt.hashCode),
                            description.hashCode),
                        name.hashCode),
                    price.hashCode),
                image.hashCode),
            cartQty.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MenuRecord')
          ..add('category', category)
          ..add('createdAt', createdAt)
          ..add('description', description)
          ..add('name', name)
          ..add('price', price)
          ..add('image', image)
          ..add('cartQty', cartQty)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MenuRecordBuilder implements Builder<MenuRecord, MenuRecordBuilder> {
  _$MenuRecord? _$v;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  int? _cartQty;
  int? get cartQty => _$this._cartQty;
  set cartQty(int? cartQty) => _$this._cartQty = cartQty;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MenuRecordBuilder() {
    MenuRecord._initializeBuilder(this);
  }

  MenuRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category = $v.category;
      _createdAt = $v.createdAt;
      _description = $v.description;
      _name = $v.name;
      _price = $v.price;
      _image = $v.image;
      _cartQty = $v.cartQty;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MenuRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MenuRecord;
  }

  @override
  void update(void Function(MenuRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MenuRecord build() => _build();

  _$MenuRecord _build() {
    final _$result = _$v ??
        new _$MenuRecord._(
            category: category,
            createdAt: createdAt,
            description: description,
            name: name,
            price: price,
            image: image,
            cartQty: cartQty,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

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
    value = object.name;
    if (value != null) {
      result
        ..add('name')
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
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.modifiedAt;
    if (value != null) {
      result
        ..add('modified_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.onSale;
    if (value != null) {
      result
        ..add('on_sale')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.salePrice;
    if (value != null) {
      result
        ..add('sale_price')
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
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cat;
    if (value != null) {
      result
        ..add('cat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.inCart;
    if (value != null) {
      result
        ..add('in_cart')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(bool)])));
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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'modified_at':
          result.modifiedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'on_sale':
          result.onSale = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'sale_price':
          result.salePrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cat':
          result.cat = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'in_cart':
          result.inCart.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(bool)]))!
              as BuiltList<Object?>);
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
  final String? name;
  @override
  final String? description;
  @override
  final double? price;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? modifiedAt;
  @override
  final bool? onSale;
  @override
  final double? salePrice;
  @override
  final String? image;
  @override
  final String? category;
  @override
  final DocumentReference<Object?>? cat;
  @override
  final BuiltList<bool>? inCart;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MenuRecord([void Function(MenuRecordBuilder)? updates]) =>
      (new MenuRecordBuilder()..update(updates))._build();

  _$MenuRecord._(
      {this.name,
      this.description,
      this.price,
      this.createdAt,
      this.modifiedAt,
      this.onSale,
      this.salePrice,
      this.image,
      this.category,
      this.cat,
      this.inCart,
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
        name == other.name &&
        description == other.description &&
        price == other.price &&
        createdAt == other.createdAt &&
        modifiedAt == other.modifiedAt &&
        onSale == other.onSale &&
        salePrice == other.salePrice &&
        image == other.image &&
        category == other.category &&
        cat == other.cat &&
        inCart == other.inCart &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, name.hashCode),
                                                description.hashCode),
                                            price.hashCode),
                                        createdAt.hashCode),
                                    modifiedAt.hashCode),
                                onSale.hashCode),
                            salePrice.hashCode),
                        image.hashCode),
                    category.hashCode),
                cat.hashCode),
            inCart.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MenuRecord')
          ..add('name', name)
          ..add('description', description)
          ..add('price', price)
          ..add('createdAt', createdAt)
          ..add('modifiedAt', modifiedAt)
          ..add('onSale', onSale)
          ..add('salePrice', salePrice)
          ..add('image', image)
          ..add('category', category)
          ..add('cat', cat)
          ..add('inCart', inCart)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MenuRecordBuilder implements Builder<MenuRecord, MenuRecordBuilder> {
  _$MenuRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  bool? _onSale;
  bool? get onSale => _$this._onSale;
  set onSale(bool? onSale) => _$this._onSale = onSale;

  double? _salePrice;
  double? get salePrice => _$this._salePrice;
  set salePrice(double? salePrice) => _$this._salePrice = salePrice;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  DocumentReference<Object?>? _cat;
  DocumentReference<Object?>? get cat => _$this._cat;
  set cat(DocumentReference<Object?>? cat) => _$this._cat = cat;

  ListBuilder<bool>? _inCart;
  ListBuilder<bool> get inCart => _$this._inCart ??= new ListBuilder<bool>();
  set inCart(ListBuilder<bool>? inCart) => _$this._inCart = inCart;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MenuRecordBuilder() {
    MenuRecord._initializeBuilder(this);
  }

  MenuRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _price = $v.price;
      _createdAt = $v.createdAt;
      _modifiedAt = $v.modifiedAt;
      _onSale = $v.onSale;
      _salePrice = $v.salePrice;
      _image = $v.image;
      _category = $v.category;
      _cat = $v.cat;
      _inCart = $v.inCart?.toBuilder();
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
    _$MenuRecord _$result;
    try {
      _$result = _$v ??
          new _$MenuRecord._(
              name: name,
              description: description,
              price: price,
              createdAt: createdAt,
              modifiedAt: modifiedAt,
              onSale: onSale,
              salePrice: salePrice,
              image: image,
              category: category,
              cat: cat,
              inCart: _inCart?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'inCart';
        _inCart?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MenuRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TokenRecord> _$tokenRecordSerializer = new _$TokenRecordSerializer();

class _$TokenRecordSerializer implements StructuredSerializer<TokenRecord> {
  @override
  final Iterable<Type> types = const [TokenRecord, _$TokenRecord];
  @override
  final String wireName = 'TokenRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TokenRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.expiration;
    if (value != null) {
      result
        ..add('expiration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recieved;
    if (value != null) {
      result
        ..add('recieved')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  TokenRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TokenRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'expiration':
          result.expiration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recieved':
          result.recieved = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$TokenRecord extends TokenRecord {
  @override
  final String? token;
  @override
  final String? expiration;
  @override
  final DateTime? recieved;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TokenRecord([void Function(TokenRecordBuilder)? updates]) =>
      (new TokenRecordBuilder()..update(updates))._build();

  _$TokenRecord._({this.token, this.expiration, this.recieved, this.ffRef})
      : super._();

  @override
  TokenRecord rebuild(void Function(TokenRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TokenRecordBuilder toBuilder() => new TokenRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TokenRecord &&
        token == other.token &&
        expiration == other.expiration &&
        recieved == other.recieved &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, token.hashCode), expiration.hashCode),
            recieved.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TokenRecord')
          ..add('token', token)
          ..add('expiration', expiration)
          ..add('recieved', recieved)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TokenRecordBuilder implements Builder<TokenRecord, TokenRecordBuilder> {
  _$TokenRecord? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _expiration;
  String? get expiration => _$this._expiration;
  set expiration(String? expiration) => _$this._expiration = expiration;

  DateTime? _recieved;
  DateTime? get recieved => _$this._recieved;
  set recieved(DateTime? recieved) => _$this._recieved = recieved;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TokenRecordBuilder() {
    TokenRecord._initializeBuilder(this);
  }

  TokenRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _expiration = $v.expiration;
      _recieved = $v.recieved;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TokenRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TokenRecord;
  }

  @override
  void update(void Function(TokenRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TokenRecord build() => _build();

  _$TokenRecord _build() {
    final _$result = _$v ??
        new _$TokenRecord._(
            token: token,
            expiration: expiration,
            recieved: recieved,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

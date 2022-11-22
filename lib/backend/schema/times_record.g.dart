// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'times_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TimesRecord> _$timesRecordSerializer = new _$TimesRecordSerializer();

class _$TimesRecordSerializer implements StructuredSerializer<TimesRecord> {
  @override
  final Iterable<Type> types = const [TimesRecord, _$TimesRecord];
  @override
  final String wireName = 'TimesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TimesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.sessions;
    if (value != null) {
      result
        ..add('sessions')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
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
  TimesRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TimesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sessions':
          result.sessions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
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

class _$TimesRecord extends TimesRecord {
  @override
  final BuiltList<DateTime>? sessions;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TimesRecord([void Function(TimesRecordBuilder)? updates]) =>
      (new TimesRecordBuilder()..update(updates))._build();

  _$TimesRecord._({this.sessions, this.ffRef}) : super._();

  @override
  TimesRecord rebuild(void Function(TimesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TimesRecordBuilder toBuilder() => new TimesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TimesRecord &&
        sessions == other.sessions &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, sessions.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TimesRecord')
          ..add('sessions', sessions)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TimesRecordBuilder implements Builder<TimesRecord, TimesRecordBuilder> {
  _$TimesRecord? _$v;

  ListBuilder<DateTime>? _sessions;
  ListBuilder<DateTime> get sessions =>
      _$this._sessions ??= new ListBuilder<DateTime>();
  set sessions(ListBuilder<DateTime>? sessions) => _$this._sessions = sessions;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TimesRecordBuilder() {
    TimesRecord._initializeBuilder(this);
  }

  TimesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sessions = $v.sessions?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TimesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TimesRecord;
  }

  @override
  void update(void Function(TimesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TimesRecord build() => _build();

  _$TimesRecord _build() {
    _$TimesRecord _$result;
    try {
      _$result = _$v ??
          new _$TimesRecord._(sessions: _sessions?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sessions';
        _sessions?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TimesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

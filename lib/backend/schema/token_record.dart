import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'token_record.g.dart';

abstract class TokenRecord implements Built<TokenRecord, TokenRecordBuilder> {
  static Serializer<TokenRecord> get serializer => _$tokenRecordSerializer;

  String? get token;

  String? get expiration;

  DateTime? get recieved;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TokenRecordBuilder builder) => builder
    ..token = ''
    ..expiration = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('token');

  static Stream<TokenRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TokenRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TokenRecord._();
  factory TokenRecord([void Function(TokenRecordBuilder) updates]) =
      _$TokenRecord;

  static TokenRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTokenRecordData({
  String? token,
  String? expiration,
  DateTime? recieved,
}) {
  final firestoreData = serializers.toFirestore(
    TokenRecord.serializer,
    TokenRecord(
      (t) => t
        ..token = token
        ..expiration = expiration
        ..recieved = recieved,
    ),
  );

  return firestoreData;
}

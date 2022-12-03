import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'menu_record.g.dart';

abstract class MenuRecord implements Built<MenuRecord, MenuRecordBuilder> {
  static Serializer<MenuRecord> get serializer => _$menuRecordSerializer;

  String? get category;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  String? get description;

  String? get name;

  double? get price;

  String? get image;

  @BuiltValueField(wireName: 'cart_qty')
  int? get cartQty;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MenuRecordBuilder builder) => builder
    ..category = ''
    ..description = ''
    ..name = ''
    ..price = 0.0
    ..image = ''
    ..cartQty = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('menu');

  static Stream<MenuRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MenuRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MenuRecord._();
  factory MenuRecord([void Function(MenuRecordBuilder) updates]) = _$MenuRecord;

  static MenuRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMenuRecordData({
  String? category,
  DateTime? createdAt,
  String? description,
  String? name,
  double? price,
  String? image,
  int? cartQty,
}) {
  final firestoreData = serializers.toFirestore(
    MenuRecord.serializer,
    MenuRecord(
      (m) => m
        ..category = category
        ..createdAt = createdAt
        ..description = description
        ..name = name
        ..price = price
        ..image = image
        ..cartQty = cartQty,
    ),
  );

  return firestoreData;
}

import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'menu_record.g.dart';

abstract class MenuRecord implements Built<MenuRecord, MenuRecordBuilder> {
  static Serializer<MenuRecord> get serializer => _$menuRecordSerializer;

  String? get name;

  String? get description;

  double? get price;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'modified_at')
  DateTime? get modifiedAt;

  @BuiltValueField(wireName: 'on_sale')
  bool? get onSale;

  @BuiltValueField(wireName: 'sale_price')
  double? get salePrice;

  String? get image;

  String? get category;

  DocumentReference? get cat;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MenuRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..price = 0.0
    ..onSale = false
    ..salePrice = 0.0
    ..image = ''
    ..category = '';

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
  String? name,
  String? description,
  double? price,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? onSale,
  double? salePrice,
  String? image,
  String? category,
  DocumentReference? cat,
}) {
  final firestoreData = serializers.toFirestore(
    MenuRecord.serializer,
    MenuRecord(
      (m) => m
        ..name = name
        ..description = description
        ..price = price
        ..createdAt = createdAt
        ..modifiedAt = modifiedAt
        ..onSale = onSale
        ..salePrice = salePrice
        ..image = image
        ..category = category
        ..cat = cat,
    ),
  );

  return firestoreData;
}

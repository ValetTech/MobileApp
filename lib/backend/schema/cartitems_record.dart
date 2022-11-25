import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cartitems_record.g.dart';

abstract class CartitemsRecord
    implements Built<CartitemsRecord, CartitemsRecordBuilder> {
  static Serializer<CartitemsRecord> get serializer =>
      _$cartitemsRecordSerializer;

  DocumentReference? get item;

  int? get quantity;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CartitemsRecordBuilder builder) =>
      builder..quantity = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('cartitems')
          : FirebaseFirestore.instance.collectionGroup('cartitems');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('cartitems').doc();

  static Stream<CartitemsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CartitemsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CartitemsRecord._();
  factory CartitemsRecord([void Function(CartitemsRecordBuilder) updates]) =
      _$CartitemsRecord;

  static CartitemsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCartitemsRecordData({
  DocumentReference? item,
  int? quantity,
}) {
  final firestoreData = serializers.toFirestore(
    CartitemsRecord.serializer,
    CartitemsRecord(
      (c) => c
        ..item = item
        ..quantity = quantity,
    ),
  );

  return firestoreData;
}

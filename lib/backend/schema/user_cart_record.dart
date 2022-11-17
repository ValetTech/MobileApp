import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_cart_record.g.dart';

abstract class UserCartRecord
    implements Built<UserCartRecord, UserCartRecordBuilder> {
  static Serializer<UserCartRecord> get serializer =>
      _$userCartRecordSerializer;

  int? get quantity;

  @BuiltValueField(wireName: 'item_ref')
  DocumentReference? get itemRef;

  @BuiltValueField(wireName: 'item_name')
  String? get itemName;

  @BuiltValueField(wireName: 'item_image')
  String? get itemImage;

  @BuiltValueField(wireName: 'item_price')
  double? get itemPrice;

  @BuiltValueField(wireName: 'cart_item_total')
  double? get cartItemTotal;

  @BuiltValueField(wireName: 'user_ref')
  DocumentReference? get userRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserCartRecordBuilder builder) => builder
    ..quantity = 0
    ..itemName = ''
    ..itemImage = ''
    ..itemPrice = 0.0
    ..cartItemTotal = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_cart');

  static Stream<UserCartRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserCartRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserCartRecord._();
  factory UserCartRecord([void Function(UserCartRecordBuilder) updates]) =
      _$UserCartRecord;

  static UserCartRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserCartRecordData({
  int? quantity,
  DocumentReference? itemRef,
  String? itemName,
  String? itemImage,
  double? itemPrice,
  double? cartItemTotal,
  DocumentReference? userRef,
}) {
  final firestoreData = serializers.toFirestore(
    UserCartRecord.serializer,
    UserCartRecord(
      (u) => u
        ..quantity = quantity
        ..itemRef = itemRef
        ..itemName = itemName
        ..itemImage = itemImage
        ..itemPrice = itemPrice
        ..cartItemTotal = cartItemTotal
        ..userRef = userRef,
    ),
  );

  return firestoreData;
}

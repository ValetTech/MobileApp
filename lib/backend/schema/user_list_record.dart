import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_list_record.g.dart';

abstract class UserListRecord
    implements Built<UserListRecord, UserListRecordBuilder> {
  static Serializer<UserListRecord> get serializer =>
      _$userListRecordSerializer;

  String? get email;

  String? get uid;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get firstName;

  String? get lastName;

  int? get pin;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserListRecordBuilder builder) => builder
    ..email = ''
    ..uid = ''
    ..photoUrl = ''
    ..phoneNumber = ''
    ..firstName = ''
    ..lastName = ''
    ..pin = 0
    ..displayName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userList');

  static Stream<UserListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserListRecord._();
  factory UserListRecord([void Function(UserListRecordBuilder) updates]) =
      _$UserListRecord;

  static UserListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserListRecordData({
  String? email,
  String? uid,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
  String? firstName,
  String? lastName,
  int? pin,
  String? displayName,
}) {
  final firestoreData = serializers.toFirestore(
    UserListRecord.serializer,
    UserListRecord(
      (u) => u
        ..email = email
        ..uid = uid
        ..photoUrl = photoUrl
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..firstName = firstName
        ..lastName = lastName
        ..pin = pin
        ..displayName = displayName,
    ),
  );

  return firestoreData;
}

import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'catagory_struct.g.dart';

abstract class CatagoryStruct
    implements Built<CatagoryStruct, CatagoryStructBuilder> {
  static Serializer<CatagoryStruct> get serializer =>
      _$catagoryStructSerializer;

  String? get title;

  String? get description;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(CatagoryStructBuilder builder) => builder
    ..title = ''
    ..description = ''
    ..firestoreUtilData = FirestoreUtilData();

  CatagoryStruct._();
  factory CatagoryStruct([void Function(CatagoryStructBuilder) updates]) =
      _$CatagoryStruct;
}

CatagoryStruct createCatagoryStruct({
  String? title,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CatagoryStruct(
      (c) => c
        ..title = title
        ..description = description
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

CatagoryStruct? updateCatagoryStruct(
  CatagoryStruct? catagory, {
  bool clearUnsetFields = true,
}) =>
    catagory != null
        ? (catagory.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addCatagoryStructData(
  Map<String, dynamic> firestoreData,
  CatagoryStruct? catagory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (catagory == null) {
    return;
  }
  if (catagory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && catagory.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final catagoryData = getCatagoryFirestoreData(catagory, forFieldValue);
  final nestedData = catagoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = catagory.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getCatagoryFirestoreData(
  CatagoryStruct? catagory, [
  bool forFieldValue = false,
]) {
  if (catagory == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(CatagoryStruct.serializer, catagory);

  // Add any Firestore field values
  catagory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCatagoryListFirestoreData(
  List<CatagoryStruct>? catagorys,
) =>
    catagorys?.map((c) => getCatagoryFirestoreData(c, true)).toList() ?? [];

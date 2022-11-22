import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'times_record.g.dart';

abstract class TimesRecord implements Built<TimesRecord, TimesRecordBuilder> {
  static Serializer<TimesRecord> get serializer => _$timesRecordSerializer;

  BuiltList<DateTime>? get sessions;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TimesRecordBuilder builder) =>
      builder..sessions = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('times');

  static Stream<TimesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TimesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TimesRecord._();
  factory TimesRecord([void Function(TimesRecordBuilder) updates]) =
      _$TimesRecord;

  static TimesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTimesRecordData() {
  final firestoreData = serializers.toFirestore(
    TimesRecord.serializer,
    TimesRecord(
      (t) => t..sessions = null,
    ),
  );

  return firestoreData;
}

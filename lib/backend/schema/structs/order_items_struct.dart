import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_items_struct.g.dart';

abstract class OrderItemsStruct
    implements Built<OrderItemsStruct, OrderItemsStructBuilder> {
  static Serializer<OrderItemsStruct> get serializer =>
      _$orderItemsStructSerializer;

  @BuiltValueField(wireName: 'item_ref')
  DocumentReference? get itemRef;

  BuiltList<double>? get subtotal;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(OrderItemsStructBuilder builder) => builder
    ..subtotal = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  OrderItemsStruct._();
  factory OrderItemsStruct([void Function(OrderItemsStructBuilder) updates]) =
      _$OrderItemsStruct;
}

OrderItemsStruct createOrderItemsStruct({
  DocumentReference? itemRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderItemsStruct(
      (o) => o
        ..itemRef = itemRef
        ..subtotal = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

OrderItemsStruct? updateOrderItemsStruct(
  OrderItemsStruct? orderItems, {
  bool clearUnsetFields = true,
}) =>
    orderItems != null
        ? (orderItems.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addOrderItemsStructData(
  Map<String, dynamic> firestoreData,
  OrderItemsStruct? orderItems,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderItems == null) {
    return;
  }
  if (orderItems.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && orderItems.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderItemsData = getOrderItemsFirestoreData(orderItems, forFieldValue);
  final nestedData = orderItemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = orderItems.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getOrderItemsFirestoreData(
  OrderItemsStruct? orderItems, [
  bool forFieldValue = false,
]) {
  if (orderItems == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(OrderItemsStruct.serializer, orderItems);

  // Add any Firestore field values
  orderItems.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderItemsListFirestoreData(
  List<OrderItemsStruct>? orderItemss,
) =>
    orderItemss?.map((o) => getOrderItemsFirestoreData(o, true)).toList() ?? [];

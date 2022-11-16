import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_item_struct.g.dart';

abstract class OrderItemStruct
    implements Built<OrderItemStruct, OrderItemStructBuilder> {
  static Serializer<OrderItemStruct> get serializer =>
      _$orderItemStructSerializer;

  int? get itemId;

  int? get quantity;

  double? get unitPrice;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(OrderItemStructBuilder builder) => builder
    ..itemId = 0
    ..quantity = 0
    ..unitPrice = 0.0
    ..firestoreUtilData = FirestoreUtilData();

  OrderItemStruct._();
  factory OrderItemStruct([void Function(OrderItemStructBuilder) updates]) =
      _$OrderItemStruct;
}

OrderItemStruct createOrderItemStruct({
  int? itemId,
  int? quantity,
  double? unitPrice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderItemStruct(
      (o) => o
        ..itemId = itemId
        ..quantity = quantity
        ..unitPrice = unitPrice
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

OrderItemStruct? updateOrderItemStruct(
  OrderItemStruct? orderItem, {
  bool clearUnsetFields = true,
}) =>
    orderItem != null
        ? (orderItem.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addOrderItemStructData(
  Map<String, dynamic> firestoreData,
  OrderItemStruct? orderItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderItem == null) {
    return;
  }
  if (orderItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && orderItem.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderItemData = getOrderItemFirestoreData(orderItem, forFieldValue);
  final nestedData = orderItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = orderItem.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getOrderItemFirestoreData(
  OrderItemStruct? orderItem, [
  bool forFieldValue = false,
]) {
  if (orderItem == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(OrderItemStruct.serializer, orderItem);

  // Add any Firestore field values
  orderItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderItemListFirestoreData(
  List<OrderItemStruct>? orderItems,
) =>
    orderItems?.map((o) => getOrderItemFirestoreData(o, true)).toList() ?? [];

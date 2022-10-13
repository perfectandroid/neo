// To parse this JSON data, do
//
//     final pending = pendingFromJson(jsonString);

import 'dart:convert';

Pending pendingFromJson(String str) => Pending.fromJson(json.decode(str));

String pendingToJson(Pending data) => json.encode(data.toJson());

class Pending {
  Pending({
    required this.id,
    required this.orderId,
    required this.paymentOrderId,
    required this.paymentAmount,
    required this.transactionId,
    required this.status,
    required this.deliveryStatus,
    required this.description,
    required this.paymentMethod,
    required this.couponAmount,
    required this.shippingCharge,
    required this.totalAmount,
    required this.grandTotal,
    required this.statusUpdateTime,
    required this.createdAt,
    required this.updatedAt,
    required this.fkUser,
    required this.fkShippingAddress,
  });

  int id;
  String orderId;
  dynamic paymentOrderId;
  dynamic paymentAmount;
  dynamic transactionId;
  String status;
  String deliveryStatus;
  dynamic description;
  String paymentMethod;
  int couponAmount;
  int shippingCharge;
  int totalAmount;
  int grandTotal;
  dynamic statusUpdateTime;
  DateTime createdAt;
  DateTime updatedAt;
  String fkUser;
  int fkShippingAddress;

  factory Pending.fromJson(Map<String, dynamic> json) => Pending(
    id: json["id"],
    orderId: json["order_id"],
    paymentOrderId: json["payment_order_id"],
    paymentAmount: json["payment_amount"],
    transactionId: json["transaction_id"],
    status: json["status"],
    deliveryStatus: json["delivery_status"],
    description: json["description"],
    paymentMethod: json["payment_method"],
    couponAmount: json["coupon_amount"],
    shippingCharge: json["shipping_charge"],
    totalAmount: json["total_amount"],
    grandTotal: json["grand_total"],
    statusUpdateTime: json["status_update_time"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    fkUser: json["fk_user"],
    fkShippingAddress: json["fk_shipping_address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "payment_order_id": paymentOrderId,
    "payment_amount": paymentAmount,
    "transaction_id": transactionId,
    "status": status,
    "delivery_status": deliveryStatus,
    "description": description,
    "payment_method": paymentMethod,
    "coupon_amount": couponAmount,
    "shipping_charge": shippingCharge,
    "total_amount": totalAmount,
    "grand_total": grandTotal,
    "status_update_time": statusUpdateTime,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "fk_user": fkUser,
    "fk_shipping_address": fkShippingAddress,
  };
}

/// success : true
/// data : [{"id":15,"order_id":"orderU3UPUYLHGKNDS41","payment_order_id":null,"payment_amount":null,"transaction_id":null,"status":"success","delivery_status":"delivered","description":null,"payment_method":"cash","coupon_amount":0.0,"shipping_charge":0.0,"customer_name":null,"quantity":null,"total_amount":100.0,"grand_total":100.0,"status_update_time":null,"created_at":"2022-10-07T05:10:58.026347Z","updated_at":"2022-11-01T10:57:05.660174Z","pending_time":null,"verified_time":null,"packed_time":null,"dispacthed_time":null,"delivered_time":null,"fk_user":"9995740386","fk_shipping_address":1},{"id":15,"order_id":"orderU3UPUYLHGKNDS41","payment_order_id":null,"payment_amount":null,"transaction_id":null,"status":"success","delivery_status":"delivered","description":null,"payment_method":"cash","coupon_amount":0.0,"shipping_charge":0.0,"customer_name":null,"quantity":null,"total_amount":100.0,"grand_total":100.0,"status_update_time":null,"created_at":"2022-10-07T05:10:58.026347Z","updated_at":"2022-11-01T10:57:05.660174Z","pending_time":null,"verified_time":null,"packed_time":null,"dispacthed_time":null,"delivered_time":null,"fk_user":"9995740386","fk_shipping_address":1},{"id":16,"order_id":"orderN2IRJZUG0RPSNG1","payment_order_id":null,"payment_amount":null,"transaction_id":null,"status":"success","delivery_status":"delivered","description":null,"payment_method":"cash","coupon_amount":0.0,"shipping_charge":0.0,"customer_name":null,"quantity":null,"total_amount":100.0,"grand_total":100.0,"status_update_time":null,"created_at":"2022-10-07T05:11:00.120919Z","updated_at":"2022-11-01T10:36:39.686566Z","pending_time":null,"verified_time":null,"packed_time":null,"dispacthed_time":null,"delivered_time":null,"fk_user":"9995740386","fk_shipping_address":1},{"id":16,"order_id":"orderN2IRJZUG0RPSNG1","payment_order_id":null,"payment_amount":null,"transaction_id":null,"status":"success","delivery_status":"delivered","description":null,"payment_method":"cash","coupon_amount":0.0,"shipping_charge":0.0,"customer_name":null,"quantity":null,"total_amount":100.0,"grand_total":100.0,"status_update_time":null,"created_at":"2022-10-07T05:11:00.120919Z","updated_at":"2022-11-01T10:36:39.686566Z","pending_time":null,"verified_time":null,"packed_time":null,"dispacthed_time":null,"delivered_time":null,"fk_user":"9995740386","fk_shipping_address":1}]
/// errors : null

class OrderReportModel {
  OrderReportModel({
      bool? success, 
      List<Data>? data, 
      dynamic errors,}){
    _success = success;
    _data = data;
    _errors = errors;
}

  OrderReportModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _errors = json['errors'];
  }
  bool? _success;
  List<Data>? _data;
  dynamic _errors;
OrderReportModel copyWith({  bool? success,
  List<Data>? data,
  dynamic errors,
}) => OrderReportModel(  success: success ?? _success,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  List<Data>? get data => _data;
  dynamic get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['errors'] = _errors;
    return map;
  }

}

/// id : 15
/// order_id : "orderU3UPUYLHGKNDS41"
/// payment_order_id : null
/// payment_amount : null
/// transaction_id : null
/// status : "success"
/// delivery_status : "delivered"
/// description : null
/// payment_method : "cash"
/// coupon_amount : 0.0
/// shipping_charge : 0.0
/// customer_name : null
/// quantity : null
/// total_amount : 100.0
/// grand_total : 100.0
/// status_update_time : null
/// created_at : "2022-10-07T05:10:58.026347Z"
/// updated_at : "2022-11-01T10:57:05.660174Z"
/// pending_time : null
/// verified_time : null
/// packed_time : null
/// dispacthed_time : null
/// delivered_time : null
/// fk_user : "9995740386"
/// fk_shipping_address : 1

class Data {
  Data({
      num? id, 
      String? orderId, 
      dynamic paymentOrderId, 
      dynamic paymentAmount, 
      dynamic transactionId, 
      String? status, 
      String? deliveryStatus, 
      dynamic description, 
      String? paymentMethod, 
      num? couponAmount, 
      num? shippingCharge, 
      dynamic customerName, 
      dynamic quantity, 
      num? totalAmount, 
      num? grandTotal, 
      dynamic statusUpdateTime, 
      String? createdAt, 
      String? updatedAt, 
      dynamic pendingTime, 
      dynamic verifiedTime, 
      dynamic packedTime, 
      dynamic dispacthedTime, 
      dynamic deliveredTime, 
      String? fkUser, 
      num? fkShippingAddress,}){
    _id = id;
    _orderId = orderId;
    _paymentOrderId = paymentOrderId;
    _paymentAmount = paymentAmount;
    _transactionId = transactionId;
    _status = status;
    _deliveryStatus = deliveryStatus;
    _description = description;
    _paymentMethod = paymentMethod;
    _couponAmount = couponAmount;
    _shippingCharge = shippingCharge;
    _customerName = customerName;
    _quantity = quantity;
    _totalAmount = totalAmount;
    _grandTotal = grandTotal;
    _statusUpdateTime = statusUpdateTime;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _pendingTime = pendingTime;
    _verifiedTime = verifiedTime;
    _packedTime = packedTime;
    _dispacthedTime = dispacthedTime;
    _deliveredTime = deliveredTime;
    _fkUser = fkUser;
    _fkShippingAddress = fkShippingAddress;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _orderId = json['order_id'];
    _paymentOrderId = json['payment_order_id'];
    _paymentAmount = json['payment_amount'];
    _transactionId = json['transaction_id'];
    _status = json['status'];
    _deliveryStatus = json['delivery_status'];
    _description = json['description'];
    _paymentMethod = json['payment_method'];
    _couponAmount = json['coupon_amount'];
    _shippingCharge = json['shipping_charge'];
    _customerName = json['customer_name'];
    _quantity = json['quantity'];
    _totalAmount = json['total_amount'];
    _grandTotal = json['grand_total'];
    _statusUpdateTime = json['status_update_time'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _pendingTime = json['pending_time'];
    _verifiedTime = json['verified_time'];
    _packedTime = json['packed_time'];
    _dispacthedTime = json['dispacthed_time'];
    _deliveredTime = json['delivered_time'];
    _fkUser = json['fk_user'];
    _fkShippingAddress = json['fk_shipping_address'];
  }
  num? _id;
  String? _orderId;
  dynamic _paymentOrderId;
  dynamic _paymentAmount;
  dynamic _transactionId;
  String? _status;
  String? _deliveryStatus;
  dynamic _description;
  String? _paymentMethod;
  num? _couponAmount;
  num? _shippingCharge;
  dynamic _customerName;
  dynamic _quantity;
  num? _totalAmount;
  num? _grandTotal;
  dynamic _statusUpdateTime;
  String? _createdAt;
  String? _updatedAt;
  dynamic _pendingTime;
  dynamic _verifiedTime;
  dynamic _packedTime;
  dynamic _dispacthedTime;
  dynamic _deliveredTime;
  String? _fkUser;
  num? _fkShippingAddress;
Data copyWith({  num? id,
  String? orderId,
  dynamic paymentOrderId,
  dynamic paymentAmount,
  dynamic transactionId,
  String? status,
  String? deliveryStatus,
  dynamic description,
  String? paymentMethod,
  num? couponAmount,
  num? shippingCharge,
  dynamic customerName,
  dynamic quantity,
  num? totalAmount,
  num? grandTotal,
  dynamic statusUpdateTime,
  String? createdAt,
  String? updatedAt,
  dynamic pendingTime,
  dynamic verifiedTime,
  dynamic packedTime,
  dynamic dispacthedTime,
  dynamic deliveredTime,
  String? fkUser,
  num? fkShippingAddress,
}) => Data(  id: id ?? _id,
  orderId: orderId ?? _orderId,
  paymentOrderId: paymentOrderId ?? _paymentOrderId,
  paymentAmount: paymentAmount ?? _paymentAmount,
  transactionId: transactionId ?? _transactionId,
  status: status ?? _status,
  deliveryStatus: deliveryStatus ?? _deliveryStatus,
  description: description ?? _description,
  paymentMethod: paymentMethod ?? _paymentMethod,
  couponAmount: couponAmount ?? _couponAmount,
  shippingCharge: shippingCharge ?? _shippingCharge,
  customerName: customerName ?? _customerName,
  quantity: quantity ?? _quantity,
  totalAmount: totalAmount ?? _totalAmount,
  grandTotal: grandTotal ?? _grandTotal,
  statusUpdateTime: statusUpdateTime ?? _statusUpdateTime,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  pendingTime: pendingTime ?? _pendingTime,
  verifiedTime: verifiedTime ?? _verifiedTime,
  packedTime: packedTime ?? _packedTime,
  dispacthedTime: dispacthedTime ?? _dispacthedTime,
  deliveredTime: deliveredTime ?? _deliveredTime,
  fkUser: fkUser ?? _fkUser,
  fkShippingAddress: fkShippingAddress ?? _fkShippingAddress,
);
  num? get id => _id;
  String? get orderId => _orderId;
  dynamic get paymentOrderId => _paymentOrderId;
  dynamic get paymentAmount => _paymentAmount;
  dynamic get transactionId => _transactionId;
  String? get status => _status;
  String? get deliveryStatus => _deliveryStatus;
  dynamic get description => _description;
  String? get paymentMethod => _paymentMethod;
  num? get couponAmount => _couponAmount;
  num? get shippingCharge => _shippingCharge;
  dynamic get customerName => _customerName;
  dynamic get quantity => _quantity;
  num? get totalAmount => _totalAmount;
  num? get grandTotal => _grandTotal;
  dynamic get statusUpdateTime => _statusUpdateTime;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get pendingTime => _pendingTime;
  dynamic get verifiedTime => _verifiedTime;
  dynamic get packedTime => _packedTime;
  dynamic get dispacthedTime => _dispacthedTime;
  dynamic get deliveredTime => _deliveredTime;
  String? get fkUser => _fkUser;
  num? get fkShippingAddress => _fkShippingAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['order_id'] = _orderId;
    map['payment_order_id'] = _paymentOrderId;
    map['payment_amount'] = _paymentAmount;
    map['transaction_id'] = _transactionId;
    map['status'] = _status;
    map['delivery_status'] = _deliveryStatus;
    map['description'] = _description;
    map['payment_method'] = _paymentMethod;
    map['coupon_amount'] = _couponAmount;
    map['shipping_charge'] = _shippingCharge;
    map['customer_name'] = _customerName;
    map['quantity'] = _quantity;
    map['total_amount'] = _totalAmount;
    map['grand_total'] = _grandTotal;
    map['status_update_time'] = _statusUpdateTime;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['pending_time'] = _pendingTime;
    map['verified_time'] = _verifiedTime;
    map['packed_time'] = _packedTime;
    map['dispacthed_time'] = _dispacthedTime;
    map['delivered_time'] = _deliveredTime;
    map['fk_user'] = _fkUser;
    map['fk_shipping_address'] = _fkShippingAddress;
    return map;
  }

}
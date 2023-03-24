/// success : true
/// data : [{"id":15,"items":[{"id":13,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":1},{"id":14,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":1}],"order_id":"orderU3UPUYLHGKNDS41","payment_order_id":null,"payment_amount":null,"transaction_id":null,"status":"success","delivery_status":"delivered","description":null,"payment_method":"cash","coupon_amount":0.0,"shipping_charge":0.0,"customer_name":null,"quantity":null,"total_amount":100.0,"grand_total":100.0,"status_update_time":null,"created_at":"2022-10-07T05:10:58.026347Z","updated_at":"2022-11-01T10:57:05.660174Z","pending_time":null,"verified_time":null,"packed_time":null,"dispacthed_time":null,"delivered_time":null,"fk_user":"9995740386","fk_shipping_address":1},{"id":15,"items":[{"id":13,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":1},{"id":14,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":1}],"order_id":"orderU3UPUYLHGKNDS41","payment_order_id":null,"payment_amount":null,"transaction_id":null,"status":"success","delivery_status":"delivered","description":null,"payment_method":"cash","coupon_amount":0.0,"shipping_charge":0.0,"customer_name":null,"quantity":null,"total_amount":100.0,"grand_total":100.0,"status_update_time":null,"created_at":"2022-10-07T05:10:58.026347Z","updated_at":"2022-11-01T10:57:05.660174Z","pending_time":null,"verified_time":null,"packed_time":null,"dispacthed_time":null,"delivered_time":null,"fk_user":"9995740386","fk_shipping_address":1},{"id":16,"items":[{"id":15,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":1},{"id":16,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":1}],"order_id":"orderN2IRJZUG0RPSNG1","payment_order_id":null,"payment_amount":null,"transaction_id":null,"status":"success","delivery_status":"delivered","description":null,"payment_method":"cash","coupon_amount":0.0,"shipping_charge":0.0,"customer_name":null,"quantity":null,"total_amount":100.0,"grand_total":100.0,"status_update_time":null,"created_at":"2022-10-07T05:11:00.120919Z","updated_at":"2022-11-01T10:36:39.686566Z","pending_time":null,"verified_time":null,"packed_time":null,"dispacthed_time":null,"delivered_time":null,"fk_user":"9995740386","fk_shipping_address":1},{"id":16,"items":[{"id":15,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":1},{"id":16,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":1}],"order_id":"orderN2IRJZUG0RPSNG1","payment_order_id":null,"payment_amount":null,"transaction_id":null,"status":"success","delivery_status":"delivered","description":null,"payment_method":"cash","coupon_amount":0.0,"shipping_charge":0.0,"customer_name":null,"quantity":null,"total_amount":100.0,"grand_total":100.0,"status_update_time":null,"created_at":"2022-10-07T05:11:00.120919Z","updated_at":"2022-11-01T10:36:39.686566Z","pending_time":null,"verified_time":null,"packed_time":null,"dispacthed_time":null,"delivered_time":null,"fk_user":"9995740386","fk_shipping_address":1}]
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
/// items : [{"id":13,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":1},{"id":14,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":1}]
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
      List<Items>? items, 
      Address? address, 
      String? orderId, 
      dynamic paymentOrderId, 
      dynamic paymentAmount, 
      dynamic transactionId, 
      Status? status, 
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
    _items = items;
    _address = address;
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
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }

    _address = json['shipping_address'] != null ? Address.fromJson(json['shipping_address']) : null;
    _orderId = json['order_id'];
    _paymentOrderId = json['payment_order_id'];
    _paymentAmount = json['payment_amount'];
    _transactionId = json['transaction_id'];
    
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;

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
  Address? _address;
  List<Items>? _items;
  String? _orderId;
  dynamic _paymentOrderId;
  dynamic _paymentAmount;
  dynamic _transactionId;
  
  Status? _status;
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
  Address? address,
  List<Items>? items,
  String? orderId,
  dynamic paymentOrderId,
  dynamic paymentAmount,
  dynamic transactionId,
  
  Status? status,
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
  address: address ?? _address, 
  items: items ?? _items,
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
  Address? get address => _address;
  List<Items>? get items => _items;
  String? get orderId => _orderId;
  dynamic get paymentOrderId => _paymentOrderId;
  dynamic get paymentAmount => _paymentAmount;
  dynamic get transactionId => _transactionId;
  Status? get status => _status;
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
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    
    if (_address != null) {
      map['shipping_address'] = _address?.toJson();
    }
    

    if (_status != null) {
      map['status'] = _status?.toJson();
    }

    map['order_id'] = _orderId;
    map['payment_order_id'] = _paymentOrderId;
    map['payment_amount'] = _paymentAmount;
    map['transaction_id'] = _transactionId;
    
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



class Status {
  Status({
     
      String? statusMessage, 
      String? deliveryStatus, 
      String? updatedAt,}){
    
    _statusMessage = statusMessage;
    _deliveryStatus = deliveryStatus;
    _updatedAt = updatedAt;
}

  Status.fromJson(dynamic json) {
   
    _statusMessage = json['statusMessage'];
    _deliveryStatus = json['deliveryStatus'];
    _updatedAt = json['updatedAt'];
  }
  
  String? _statusMessage;
  String? _deliveryStatus;
  String? _updatedAt;
Status copyWith({  num? id,
  String? statusMessage,
  String? deliveryStatus,
  String? updatedAt,
}) => Status(  
  statusMessage: statusMessage ?? _statusMessage,
  deliveryStatus: deliveryStatus ?? _deliveryStatus,
  updatedAt: updatedAt ?? _updatedAt,
);
  
  String? get statusMessage => _statusMessage;
  String? get deliveryStatus => _deliveryStatus;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
   
    map['statusMessage'] = _statusMessage;
    map['deliveryStatus'] = _deliveryStatus;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}

/// id : 13
/// product_name : "salt"
/// quantity : 10
/// coupon_percent : 0.0
/// coupon_amount : 0.0
/// total_amount : 10.0
/// net_amount : 12.0
/// fk_product : 1

class Items {
  Items({
      num? id, 
      String? productName, 
      num? quantity, 
      num? couponPercent, 
      num? couponAmount, 
      num? totalAmount, 
      num? netAmount, 
      num? fkProduct,}){
    _id = id;
    _productName = productName;
    _quantity = quantity;
    _couponPercent = couponPercent;
    _couponAmount = couponAmount;
    _totalAmount = totalAmount;
    _netAmount = netAmount;
    _fkProduct = fkProduct;
}

  Items.fromJson(dynamic json) {
    _id = json['id'];
    _productName = json['product_name'];
    _quantity = json['quantity'];
    _couponPercent = json['coupon_percent'];
    _couponAmount = json['coupon_amount'];
    _totalAmount = json['total_amount'];
    _netAmount = json['net_amount'];
    _fkProduct = json['fk_product'];
  }
  num? _id;
  String? _productName;
  num? _quantity;
  num? _couponPercent;
  num? _couponAmount;
  num? _totalAmount;
  num? _netAmount;
  num? _fkProduct;
Items copyWith({  num? id,
  String? productName,
  num? quantity,
  num? couponPercent,
  num? couponAmount,
  num? totalAmount,
  num? netAmount,
  num? fkProduct,
}) => Items(  id: id ?? _id,
  productName: productName ?? _productName,
  quantity: quantity ?? _quantity,
  couponPercent: couponPercent ?? _couponPercent,
  couponAmount: couponAmount ?? _couponAmount,
  totalAmount: totalAmount ?? _totalAmount,
  netAmount: netAmount ?? _netAmount,
  fkProduct: fkProduct ?? _fkProduct,
);
  num? get id => _id;
  String? get productName => _productName;
  num? get quantity => _quantity;
  num? get couponPercent => _couponPercent;
  num? get couponAmount => _couponAmount;
  num? get totalAmount => _totalAmount;
  num? get netAmount => _netAmount;
  num? get fkProduct => _fkProduct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_name'] = _productName;
    map['quantity'] = _quantity;
    map['coupon_percent'] = _couponPercent;
    map['coupon_amount'] = _couponAmount;
    map['total_amount'] = _totalAmount;
    map['net_amount'] = _netAmount;
    map['fk_product'] = _fkProduct;
    return map;
  }

}


class Address {
  Address({
      num? id, 
      String? countryName, 
      String? stateName, 
      String? cityName, 
      dynamic shippingCharge, 
      String? name, 
      dynamic email, 
      String? address, 
      String? phone, 
      dynamic addressCategory, 
      String? pin, 
      bool? isActive, 
      bool? isBilling, 
      num? fkCountry, 
      num? fkState, 
      num? fkCity,}){
    _id = id;
    _countryName = countryName;
    _stateName = stateName;
    _cityName = cityName;
    _shippingCharge = shippingCharge;
    _name = name;
    _email = email;
    _address = address;
    _phone = phone;
    _addressCategory = addressCategory;
    _pin = pin;
    _isActive = isActive;
    _isBilling = isBilling;
    _fkCountry = fkCountry;
    _fkState = fkState;
    _fkCity = fkCity;
}

  Address.fromJson(dynamic json) {
    _id = json['id'] ?? 0;
    _countryName = json['country_name'] ?? "";
    _stateName = json['state_name'] ?? "";
    _cityName = json['city_name'] ?? "";
    _shippingCharge = json['shipping_charge'] ?? "0.00";
    _name = json['name'] ?? "";
    _email = json['email'];
    _address = json['address'] ?? "";
    _phone = json['phone'] ?? "";
    _addressCategory = json['address_category'] ?? "";
    _pin = json['pin'] ?? "";
    _isActive = json['is_active'] ?? false;
    _isBilling = json['is_billing'] ?? false;
    _fkCountry = json['fk_country'] ?? 0;
    _fkState = json['fk_state'] ?? 0;
    _fkCity = json['fk_city'] ?? 0;
  }
  num? _id;
  String? _countryName;
  String? _stateName;
  String? _cityName;
  dynamic _shippingCharge;
  String? _name;
  dynamic _email;
  String? _address;
  String? _phone;
  dynamic _addressCategory;
  String? _pin;
  bool? _isActive;
  bool? _isBilling;
  num? _fkCountry;
  num? _fkState;
  num? _fkCity;
Address copyWith({  num? id,
  String? countryName,
  String? stateName,
  String? cityName,
  dynamic shippingCharge,
  String? name,
  dynamic email,
  String? address,
  String? phone,
  dynamic addressCategory,
  String? pin,
  bool? isActive,
  bool? isBilling,
  num? fkCountry,
  num? fkState,
  num? fkCity,
}) => Address(  id: id ?? _id,
  countryName: countryName ?? _countryName,
  stateName: stateName ?? _stateName,
  cityName: cityName ?? _cityName,
  shippingCharge: shippingCharge ?? _shippingCharge,
  name: name ?? _name,
  email: email ?? _email,
  address: address ?? _address,
  phone: phone ?? _phone,
  addressCategory: addressCategory ?? _addressCategory,
  pin: pin ?? _pin,
  isActive: isActive ?? _isActive,
  isBilling: isBilling ?? _isBilling,
  fkCountry: fkCountry ?? _fkCountry,
  fkState: fkState ?? _fkState,
  fkCity: fkCity ?? _fkCity,
);
  num? get id => _id;
  String? get countryName => _countryName;
  String? get stateName => _stateName;
  String? get cityName => _cityName;
  dynamic get shippingCharge => _shippingCharge;
  String? get name => _name;
  dynamic get email => _email;
  String? get address => _address;
  String? get phone => _phone;
  dynamic get addressCategory => _addressCategory;
  String? get pin => _pin;
  bool? get isActive => _isActive;
  bool? get isBilling => _isBilling;
  num? get fkCountry => _fkCountry;
  num? get fkState => _fkState;
  num? get fkCity => _fkCity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['country_name'] = _countryName;
    map['state_name'] = _stateName;
    map['city_name'] = _cityName;
    map['shipping_charge'] = _shippingCharge;
    map['name'] = _name;
    map['email'] = _email;
    map['address'] = _address;
    map['phone'] = _phone;
    map['address_category'] = _addressCategory;
    map['pin'] = _pin;
    map['is_active'] = _isActive;
    map['is_billing'] = _isBilling;
    map['fk_country'] = _fkCountry;
    map['fk_state'] = _fkState;
    map['fk_city'] = _fkCity;
    return map;
  }

}
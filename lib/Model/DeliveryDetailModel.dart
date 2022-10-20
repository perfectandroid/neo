/// success : true
/// data : {"id":2,"address":{"id":1,"country_name":"India","state_name":"Kerala","city_name":"Kozhikode","shipping_charge":null,"name":"shibin","email":null,"address":"kozhikode","phone":"8281440386","address_category":null,"pin":"673601","is_active":true,"is_billing":false,"fk_country":1,"fk_state":1,"fk_city":1},"items":[{"id":2,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":3},{"id":3,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":1}],"order_id":"orderTOY22D8WHK2XVHQ","payment_order_id":null,"payment_amount":null,"transaction_id":null,"status":"success","delivery_status":"delivered","description":null,"payment_method":"cash","coupon_amount":0.0,"shipping_charge":0.0,"customer_name":null,"quantity":null,"total_amount":100.0,"grand_total":100.0,"status_update_time":null,"fk_shipping_address":1}
/// errors : null

class DeliveryDetailModel {
  DeliveryDetailModel({
      bool? success, 
      Data? data, 
      dynamic errors,}){
    _success = success;
    _data = data;
    _errors = errors;
}

  DeliveryDetailModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _errors = json['errors'];
  }
  bool? _success;
  Data? _data;
  dynamic _errors;
DeliveryDetailModel copyWith({  bool? success,
  Data? data,
  dynamic errors,
}) => DeliveryDetailModel(  success: success ?? _success,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  Data? get data => _data;
  dynamic get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['errors'] = _errors;
    return map;
  }

}

/// id : 2
/// address : {"id":1,"country_name":"India","state_name":"Kerala","city_name":"Kozhikode","shipping_charge":null,"name":"shibin","email":null,"address":"kozhikode","phone":"8281440386","address_category":null,"pin":"673601","is_active":true,"is_billing":false,"fk_country":1,"fk_state":1,"fk_city":1}
/// items : [{"id":2,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":3},{"id":3,"product_name":"salt","quantity":10,"coupon_percent":0.0,"coupon_amount":0.0,"total_amount":10.0,"net_amount":12.0,"fk_product":1}]
/// order_id : "orderTOY22D8WHK2XVHQ"
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
/// fk_shipping_address : 1

class Data {
  Data({
      num? id, 
      Address? address, 
      List<Items>? items, 
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
      num? fkShippingAddress,}){
    _id = id;
    _address = address;
    _items = items;
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
    _fkShippingAddress = fkShippingAddress;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
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
    _fkShippingAddress = json['fk_shipping_address'];
  }
  num? _id;
  Address? _address;
  List<Items>? _items;
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
  num? _fkShippingAddress;
Data copyWith({  num? id,
  Address? address,
  List<Items>? items,
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
  fkShippingAddress: fkShippingAddress ?? _fkShippingAddress,
);
  num? get id => _id;
  Address? get address => _address;
  List<Items>? get items => _items;
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
  num? get fkShippingAddress => _fkShippingAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
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
    map['fk_shipping_address'] = _fkShippingAddress;
    return map;
  }

}

/// id : 2
/// product_name : "salt"
/// quantity : 10
/// coupon_percent : 0.0
/// coupon_amount : 0.0
/// total_amount : 10.0
/// net_amount : 12.0
/// fk_product : 3

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

/// id : 1
/// country_name : "India"
/// state_name : "Kerala"
/// city_name : "Kozhikode"
/// shipping_charge : null
/// name : "shibin"
/// email : null
/// address : "kozhikode"
/// phone : "8281440386"
/// address_category : null
/// pin : "673601"
/// is_active : true
/// is_billing : false
/// fk_country : 1
/// fk_state : 1
/// fk_city : 1

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
    _id = json['id'];
    _countryName = json['country_name'];
    _stateName = json['state_name'];
    _cityName = json['city_name'];
    _shippingCharge = json['shipping_charge'];
    _name = json['name'];
    _email = json['email'];
    _address = json['address'];
    _phone = json['phone'];
    _addressCategory = json['address_category'];
    _pin = json['pin'];
    _isActive = json['is_active'];
    _isBilling = json['is_billing'];
    _fkCountry = json['fk_country'];
    _fkState = json['fk_state'];
    _fkCity = json['fk_city'];
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
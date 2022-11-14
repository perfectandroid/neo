/// success : true
/// data : {"status":["initiated","success","failed","cancelled","order_cancelled","order_returned","pending"]}
/// errors : null

class OrderStatusModel {
  OrderStatusModel({
      bool? success, 
      Data? data, 
      dynamic errors,}){
    _success = success;
    _data = data;
    _errors = errors;
}

  OrderStatusModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _errors = json['errors'];
  }
  bool? _success;
  Data? _data;
  dynamic _errors;
OrderStatusModel copyWith({  bool? success,
  Data? data,
  dynamic errors,
}) => OrderStatusModel(  success: success ?? _success,
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

/// status : ["initiated","success","failed","cancelled","order_cancelled","order_returned","pending"]

class Data {
  Data({
      List<String>? status,}){
    _status = status;
}

  Data.fromJson(dynamic json) {
    _status = json['status'] != null ? json['status'].cast<String>() : [];
  }
  List<String>? _status;
Data copyWith({  List<String>? status,
}) => Data(  status: status ?? _status,
);
  List<String>? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    return map;
  }

}